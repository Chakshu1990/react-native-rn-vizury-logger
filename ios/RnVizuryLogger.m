#import "RnVizuryLogger.h"

@implementation RnVizuryLogger

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(sampleMethod:(NSString *)stringArgument numberParameter:(nonnull NSNumber *)numberArgument callback:(RCTResponseSenderBlock)callback)
{
    // TODO: Implement some actually useful functionality
    callback(@[[NSString stringWithFormat: @"numberArgument: %@ stringArgument: %@", numberArgument, stringArgument]]);
}
RCT_EXPORT_METHOD(logVE360:(NSDictionary *)param param2:(NSString *)param2) {
  NSLog(@"Welcome, %@", param);
}

@end
