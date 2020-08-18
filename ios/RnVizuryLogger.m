#import "RnVizuryLogger.h"
#import <VizuryEventLogger/VizuryEventLogger.h>

@implementation RnVizuryLogger

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}
RCT_EXPORT_METHOD(logVE360:(NSDictionary *)param param2:(NSString *)param2) {
  NSLog(@"Welcome, %@", param);
    [VizuryEventLogger logEvent:param2 WithAttributes:param];
}

RCT_EXPORT_METHOD(passFCMToken:(NSString *)recieveFCMTOken)
{
  NSData *data = [recieveFCMTOken dataUsingEncoding:NSUTF8StringEncoding];
  [VizuryEventLogger registerForPushWithToken:data];
  RCTLogInfo(@"Pretending to create an event %@",recieveFCMTOken);
  recivedFCMTOKEN = recieveFCMTOken;
}

RCT_EXPORT_METHOD(rejectionHandle:(NSString *)rejectRecieve)
{
  [VizuryEventLogger didFailToRegisterForPush];
  RCTLogInfo(@"Pretending to create an event %@",rejectRecieve);
}

@end
