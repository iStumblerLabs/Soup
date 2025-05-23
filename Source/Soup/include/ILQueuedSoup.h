#import <Foundation/Foundation.h>

#ifdef SWIFT_PACKAGE
#import "ILSoup.h"
#else
#import <Soup/ILSoup.h>
#endif

NS_ASSUME_NONNULL_BEGIN

/// Performs all soup operations and delegate callbacks on particular queues with delegate callbacks made on the main queue
@interface ILQueuedSoup : NSObject <ILSoup>
@property(nonatomic, retain) id<ILSoup> queued;
@property(nonatomic, retain) NSOperationQueue* soupOperations;

+ (instancetype) queuedSoup:(id<ILSoup>) queuedSoup soupQueue:(nullable NSOperationQueue*) soupOps;

@end

// MARK: -

/// delegate callbacks for deferred operations
///    <a id="ILSoupDelegate"></a>
@protocol ILQueuedSoupDelegate <ILSoupDelegate>

@end

NS_ASSUME_NONNULL_END
