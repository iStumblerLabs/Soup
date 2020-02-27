@import Foundation;

#import <Soup/ILSoup.h>

/// Performs all soup operations and delegate callbacks on particular queues with delegate callbacks made on the main queue
@interface ILQueuedSoup : NSObject <ILSoup>
@property(retain) id<ILSoup> queued;
@property(retain) NSOperationQueue* soupOperations;

+ (instancetype) queuedSoup:(id<ILSoup>) queuedSoup soupQueue:(NSOperationQueue*) soupOps;

@end

// MARK: -

/// delegate calbacks for deferred operations
///    <a id="ILSoupDelegate"></a>
@protocol ILQueuedSoupDelegate <ILSoupDelegate>

@end
