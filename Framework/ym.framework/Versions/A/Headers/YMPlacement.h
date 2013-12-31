#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol YMPlacementListener;

@interface YMPlacement : NSObject

-(instancetype)initWithWebView: (UIWebView*)web
                andPlacementId: (NSString*)plid;
-(UIView*) view;
-(NSString*) placementId;
-(void)setDelegate:(id<YMPlacementListener>) delegate;

@end


@protocol YMPlacementListener <NSObject>

@required
// the placement might change size on device orientation events
// to accomodate the landscape/portrait view
//
-(void) placement:(YMPlacement*)yieldmoPlacement
changedDimensions:(CGSize)dimensions;
@end
