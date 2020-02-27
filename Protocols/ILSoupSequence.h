#ifndef ILSoupSequence_h
#define ILSoupSequence_h

@import CoreGraphics;

// MARK: -

@protocol ILSoupEntry;
@protocol ILSoupSequenceSource;

// MARK: -

/// store a sequence for a numeric value
@protocol ILSoupSequence

/// the path for the sequence value
@property(readonly) NSString* sequencePath;

// MARK: -

/// create a sequence with the path provided
+ (instancetype) sequenceWithPath:(NSString*) sequencePath;

// MARK: -

/// sequence the entry provided, at the time index
- (void) sequenceEntry:(id<ILSoupEntry>) entry atTime:(NSDate*) timeIndex;

/// remove the entry from the sequence
- (void) removeEntry:(id<ILSoupEntry>) entry;

/// - Returns: YES if there is a sequence for this entry
- (BOOL) includesEntry:(id<ILSoupEntry>) entry;

// MARK: - fetching sequence data

/// - Returns: YES if the fetch succeeded to get all sequence dates and values for a given entry
- (BOOL) fetchSequenceFor:(id<ILSoupEntry>) entry times:(NSArray<NSDate*>**) timeArray values:(NSArray<NSNumber*>**) valueArray;

///  get a sequence source for the entry */
- (id<ILSoupSequenceSource>) fetchSequenceSourceFor:(id<ILSoupEntry>) entry;

@end

// MARK: -

/// ILSparkLineDataSource Impedence Match
@protocol ILSoupSequenceSource

/// array of dates for which sample values are avaliable
@property(nonatomic, readonly) NSArray<NSDate*>* sampleDates;

/// scaled sample value between 0.0 and 1.0 at the index in the sampleDates array
- (CGFloat) sampleValueAtIndex:(NSUInteger) index;

@end

#endif
