#import <Foundation/Foundation.h>
#import <Soup/ILSoup.h>

/* Synchronizes all soup operations so you can easily access a soup from multiple threads or queues */
@interface ILSynchSoup : NSObject <ILSoup>
@property(retain) id<ILSoup> synchronized;

+ (instancetype) synchronizedSoup:(id<ILSoup>) synched;

@end
