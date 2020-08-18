#import "RnVizuryLogger.h"
#import <VizuryEventLogger/VizuryEventLogger.h>

@implementation RnVizuryLogger

RCT_EXPORT_MODULE()


+(void)initalizationVizury:(UIApplication *)application   packageId:(NSString*)packageId serverURL:(NSString*)serverURL cachingEnabled:(BOOL)cachingEnabled FCMEnabled:(BOOL)FCMEnabled  {
    
    [VizuryEventLogger initializeEventLoggerInApplication:application WithPackageId:packageId
                                                ServerURL: serverURL WithCachingEnabled:cachingEnabled AndWithFCMEnabled:FCMEnabled];
}
+(void)didReceiveRemoteNotificationInApplication:(UIApplication *)application withUserInfo:(NSDictionary *)userInfo{
    
    [VizuryEventLogger didReceiveRemoteNotificationInApplication:application withUserInfo:userInfo];
}

+(void)passAPNSToken:(NSData *)data{
    
    NSLog(@"Pretending to create an event %@",recieveAPNSTOken);
   // NSData *data = [recieveAPNSTOken dataUsingEncoding:NSUTF8StringEncoding];
    [VizuryEventLogger registerForPushWithToken:data];
    
    
}
RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}
RCT_EXPORT_METHOD(logVE360:(NSDictionary *)param param2:(NSString *)param2) {
  NSLog(@"Welcome, %@", param);
    [VizuryEventLogger logEvent:param2 WithAttributes:param];
}

RCT_EXPORT_METHOD(passAPNSToken:(NSString *)recieveAPNSTOken)
{
  NSLog(@"Pretending to create an event %@",recieveAPNSTOken);
  NSData *data = [recieveAPNSTOken dataUsingEncoding:NSUTF8StringEncoding];
  [VizuryEventLogger registerForPushWithToken:data];
  
  
}

RCT_EXPORT_METHOD(rejectionHandle:(NSString *)rejectRecieve)
{
  [VizuryEventLogger didFailToRegisterForPush];
  NSLog(@"Pretending to create an event %@",rejectRecieve);
}

@end
