#import "ILSoupClock.h"

@interface ILSoupClock ()
@property(nonatomic,retain) NSDate* earliestStorage;
@property(nonatomic,retain) NSDate* latestStorage;
@end

// MARK: -

@implementation ILSoupClock

+ (id<ILSoupTime>) timeSpanWithEarliest:(NSDate*)earliest andLatest:(NSDate*)latest {
    return [self.alloc initWithEarliest:earliest andLatest:latest];
}

+ (id<ILSoupTime>) timeSpanWithEarliest:(NSDate*)earliest andInterval:(NSTimeInterval)interval {
    return [self.alloc initWithEarliest:earliest andLatest:[earliest dateByAddingTimeInterval:interval]];
}

+ (id<ILSoupTime>)anytime {
    return nil;
}


+ (id<ILSoupTime>)earlier {
    return nil;
}


+ (id<ILSoupTime>)lastCentury {
    return nil;
}


+ (id<ILSoupTime>)lastDecade {
    return nil;
}


+ (id<ILSoupTime>)lastMillenium {
    return nil;
}


+ (id<ILSoupTime>)lastYear {
    return nil;
}


+ (id<ILSoupTime>)later {
    return nil;
}


+ (id<ILSoupTime>)never {
    return nil;
}


+ (id<ILSoupTime>)nextCentury {
    return nil;
}


+ (id<ILSoupTime>)nextDecade {
    return nil;
}


+ (id<ILSoupTime>)nextMillenium {
    return nil;
}


+ (id<ILSoupTime>)nextYear {
    return nil;
}


+ (id<ILSoupTime>)nowish {
    return nil;
}


+ (id<ILSoupTime>)recenly {
    return nil;
}


+ (id<ILSoupTime>)soonish {
    return nil;
}


+ (id<ILSoupTime>)thisCentury {
    return nil;
}


+ (id<ILSoupTime>)thisDecade {
    return nil;
}


+ (id<ILSoupTime>)thisMillenium {
    return nil;
}


+ (id<ILSoupTime>)thisYear {
    return nil;
}


+ (id<ILSoupTime>)today {
    return nil;
}


+ (id<ILSoupTime>)whenever {
    return nil;
}

// MARK: -

- (instancetype) initWithEarliest:(NSDate*)earliest andLatest:(NSDate*)latest {
    if ((self = super.init)) {
        self.earliestStorage = earliest;
        self.latestStorage = latest;
    }
    return self;
}

// MARK: -

- (NSDate*) earliest {
    return self.earliestStorage;
}

- (NSDate*) latest {
    return self.latestStorage;
}

- (NSTimeInterval) interval {
    return [self.latest timeIntervalSinceDate:self.earliest];
}


@end
