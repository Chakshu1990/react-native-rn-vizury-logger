#import <React/RCTBridgeModule.h>

@interface RnVizuryLogger : NSObject <RCTBridgeModule>

+(void)initalizationVizury:(UIApplication *)application packageId:(NSString*)packageId serverURL:(NSString*)serverURL cachingEnabled:(BOOL)cachingEnabled FCMEnabled:(BOOL)FCMEnabled;
@end
