#import "ILSynchSoup.h"

@implementation ILSynchSoup
@synthesize defaultEntry;
@synthesize delegate;

+ (instancetype) makeSoup:(NSString*) soupName
{
    return nil;
}

+ (instancetype) synchronizedSoup:(id<ILSoup>) synched
{
    ILSynchSoup* soup = [ILSynchSoup new];
    soup.synchronized = synched;
    return soup;
}

#pragma mark -

- (NSUUID*) soupUUID
{
    @synchronized(self.synchronized) {
        return self.synchronized.soupUUID;
    }
}

- (NSString*) soupName
{
    @synchronized(self.synchronized) {
        return self.synchronized.soupName;
    }
}

- (void) setSoupName:(NSString*) newName
{
    @synchronized(self.synchronized) {
        self.synchronized.soupName = newName;
    }
}

- (NSString*) soupDescription
{
    @synchronized(self.synchronized) {
        return self.synchronized.soupDescription;
    }
}

- (void) setSoupDescription:(NSString*) newDescription
{
    @synchronized(self.synchronized) {
        self.synchronized.soupDescription = newDescription;
    }
}

- (NSPredicate*) soupQuery
{
    @synchronized(self.synchronized) {
        return self.synchronized.soupQuery;
    }
}

- (void) setSoupQuery:(NSPredicate*) newQuery
{
    @synchronized(self.synchronized) {
        self.synchronized.soupQuery = newQuery;
    }
}

- (NSDictionary*) defaultEntry
{
    @synchronized(self.synchronized) {
        return self.synchronized.defaultEntry;
    }
}

- (void) setDefaultEntry:(NSDictionary*) newDefaults
{
    @synchronized(self.synchronized) {
        self.synchronized.defaultEntry = newDefaults;
    }
}

- (id<ILSoupDelegate>) delegate
{
    @synchronized(self.synchronized) {
        return self.synchronized.delegate;
    }
}

#pragma mark - Entries

- (NSString*) addEntry:(id<ILSoupEntry>) entry;
{
    @synchronized(self.synchronized) {
        return [self.synchronized addEntry:entry];
    }
}

- (id<ILMutableSoupEntry>) createBlankEntry;
{
    @synchronized(self.synchronized) {
        return [self.synchronized createBlankEntry];
    }
}

- (void) deleteEntry:(id<ILSoupEntry>) entry;
{
    @synchronized(self.synchronized) {
        [self.synchronized deleteEntry:entry];
    }
}

- (id<ILMutableSoupEntry>) duplicateEntry:(id<ILSoupEntry>) entry;
{
    @synchronized(self.synchronized) {
        return [self.synchronized duplicateEntry:entry];
    }
}

- (NSString*) entryAlias:(id<ILSoupEntry>) entry;
{
    @synchronized(self.synchronized) {
        return [self.synchronized entryAlias:entry];
    }
}

- (id<ILSoupEntry>) gotoAlias:(NSString*) alias
{
    @synchronized(self.synchronized) {
        return [self.synchronized gotoAlias:alias];
    }
}

#pragma mark - Indicies

- (NSArray<id<ILSoupIndex>>*) soupIndicies
{
    @synchronized(self.synchronized) {
        return self.synchronized.soupIndicies;
    }
}

- (id<ILSoupIndex>) createIndex:(NSString*)indexPath;
{
    @synchronized(self.synchronized) {
        return [self.synchronized createIndex:indexPath];
    }
}

- (id<ILSoupDateIndex>)createDateIndex:(NSString *)indexPath {
    @synchronized(self.synchronized) {
        return [self.synchronized createDateIndex:indexPath];
    }
}

- (id<ILSoupNumberIndex>)createNumberIndex:(NSString *)indexPath {
    @synchronized(self.synchronized) {
        return [self.synchronized createNumberIndex:indexPath];
    }
}


- (id<ILSoupTextIndex>)createTextIndex:(NSString *)indexPath {
    @synchronized(self.synchronized) {
        return [self.synchronized createTextIndex:indexPath];
    }
}

- (id<ILSoupIndex>)queryIndex:(NSString *)indexPath {
    @synchronized(self.synchronized) {
        return [self.synchronized queryIndex:indexPath];
    }
}

#pragma mark - Default Cursor

- (id<ILSoupCursor>) setupCursor
{
    @synchronized(self.synchronized) {
        return [self.synchronized setupCursor];
    }
}

- (id<ILSoupCursor>) getCursor
{
    @synchronized(self.synchronized) {
        return [self.synchronized getCursor];
    }
}

- (id<ILSoupCursor>) querySoup:(NSPredicate*) query
{
    @synchronized(self.synchronized) {
        return [self.synchronized querySoup:query];
    }
}

#pragma mark - Sequences

- (NSArray<id<ILSoupSequence>>*) soupSequences
{
    @synchronized(self.synchronized) {
        return self.synchronized.soupSequences;
    }
}

- (id<ILSoupSequence>) createSequence:(NSString*) sequencePath
{
    @synchronized(self.synchronized) {
        return [self.synchronized createSequence:sequencePath];
    }
}

- (id<ILSoupSequence>)querySequence:(NSString *)sequencePath {
    @synchronized(self.synchronized) {
        return [self.synchronized querySequence:sequencePath];
    }
}

#pragma mark - Soup Managment

- (void) doneWithSoup:(NSString*) appIdentifier
{
    @synchronized(self.synchronized) {
        [self.synchronized doneWithSoup:appIdentifier];
    }
}

- (void) fillNewSoup
{
    @synchronized(self.synchronized) {
        [self.synchronized fillNewSoup];
    }
}

@end
