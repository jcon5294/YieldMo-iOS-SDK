#import <Foundation/Foundation.h>

#import "YMPlacement.h"

@interface YM : NSObject
+(instancetype) sharedYM;
-(void) setAppId: (NSString *)appId;
-(void) setDryRun: (BOOL)yesno;
-(void) enableLogging:(BOOL) trueFalse;
-(void) fetchPlacements:(NSArray*) pls
  withCompletionHandler:(void (^)(NSArray *ymPlacements, NSError*  error)) handler;
@end
