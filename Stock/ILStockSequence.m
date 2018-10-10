#import "ILStockSequence.h"
#import "ILSoupEntry.h"

@interface ILStockSequenceEntry : NSObject
@property(retain) NSString* entryHash; // at the time
@property(retain) NSNumber* entryValue;
@property(retain) NSDate* entryDate;

@end

#pragma mark -

@implementation ILStockSequenceEntry

@end

#pragma mark -

@interface ILStockSequence ()
@property(retain) NSString* sequencePathStorage;
@property(retain) NSMutableDictionary<NSString*,id>* sequenceStorage;
@end

#pragma mark -

@implementation ILStockSequence

+ (instancetype) sequenceWithPath:(NSString*) sequencePath
{
    ILStockSequence* stockSequence = ILStockSequence.new;
    stockSequence.sequencePathStorage = sequencePath;
    stockSequence.sequenceStorage = NSMutableDictionary.new;

    return stockSequence;
}

#pragma mark - Properties

- (NSString*) sequencePath
{
    return self.sequencePathStorage;
}

- (void) sequenceEntry:(id<ILSoupEntry>) entry atTime:(NSDate*) timeIndex
{
    id value = [entry.entryKeys valueForKeyPath:self.sequencePath];
    NSNumber* numberValue = nil;
    if ([value isKindOfClass:NSNumber.class]) {
        numberValue = (NSNumber*) value;
    }
    else if ([value respondsToSelector:@selector(doubleValue)]) {
        numberValue = @([value doubleValue]);
    }
    
    if (numberValue) {
        ILStockSequenceEntry* sequencyEntry = [ILStockSequenceEntry new];
        sequencyEntry.entryHash = entry.entryHash;
        sequencyEntry.entryDate = timeIndex;
        sequencyEntry.entryValue = numberValue;
        
        NSMutableArray* sequence = self.sequenceStorage[entry.entryKeys[ILSoupEntryUUID]];
        if (!sequence) {
            sequence = NSMutableArray.new;
            self.sequenceStorage[entry.entryKeys[ILSoupEntryUUID]] = sequence;
        }
        
        [sequence addObject:sequencyEntry];
    }
    // else report sequence error?
}

- (void) removeEntry:(id<ILSoupEntry>) entry
{
    [self.sequenceStorage removeObjectForKey:entry.entryKeys[ILSoupEntryUUID]];
}

- (BOOL) includesEntry:(id<ILSoupEntry>) entry
{
    return [self.sequenceStorage.allKeys containsObject:entry.entryKeys[ILSoupEntryUUID]];
}

#pragma mark - fetching sequence data

- (BOOL) fetchSequenceFor:(id<ILSoupEntry>) entry times:(NSArray<NSDate*>**) timeArray values:(NSArray<NSNumber*>**) valueArray
{
    NSArray<ILStockSequenceEntry*>* sequence = [self.sequenceStorage[entry.entryKeys[ILSoupEntryUUID]] copy]; // snapshot
    NSMutableArray* timeSequence = [NSMutableArray arrayWithCapacity:sequence.count];
    NSMutableArray* valueSequence = [NSMutableArray arrayWithCapacity:sequence.count];
    NSUInteger index = 0;
    for (ILStockSequenceEntry* entry in sequence) {
        timeSequence[index] = entry.entryDate;
        valueSequence[index] = entry.entryValue;
        index++;
    }
    
    *timeArray = timeSequence;
    *valueArray = valueSequence;

    return (sequence != nil);
}

- (id<ILSoupSequenceSource>) fetchSequenceSourceFor:(id<ILSoupEntry>) entry
{
    ILStockSequenceSource* source;
//    NSArray<NSDate*>* sequenceTimes;
//    NSArray<NSNumber*>* sequenceValues;
//
//    if ([self fetchSequenceFor:entry times:&sequenceTimes value:&sequenceValues]) {
//        source = [ILStockSequenceSource sequencSourceWithTimes:sequenceTimes andValues:sequenceValues];
//    }

    return source;
}

#pragma mark - NSObject

- (NSString*) description
{
    return [NSString stringWithFormat:@"%@ %@ %lu entries", self.className, self.sequencePath, self.sequenceStorage.allKeys.count];
}

@end

#pragma mark -

@interface ILStockSequenceSource ()
@property(nonatomic, retain) NSArray<NSDate*>* sequenceDates;
@property(nonatomic, retain) NSArray<NSNumber*>* sequenceValues;

@end

#pragma mark -

@implementation ILStockSequenceSource

+ (instancetype) sequencSourceWithTimes:(NSArray<NSDate*>*) seqenceTimes andValues:(NSArray<NSNumber*>*) sequenceValues;
{
    ILStockSequenceSource* stockSource = ILStockSequenceSource.new;
    stockSource.sequenceDates = seqenceTimes;
    stockSource.sequenceValues = sequenceValues;
    return stockSource;
}

#pragma mark -

- (NSArray<NSDate*>*) sampleDates
{
    return self.sequenceDates;
}

- (CGFloat)sampleValueAtIndex:(NSUInteger)index
{
    return [self.sequenceValues[index] doubleValue];
}

@end
