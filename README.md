# VizuryEventLoggerReact Native

Vizury is a commerce marketing platform and its personalized retargeting stack is used by digital companies to grow marketing ROI and enhance transactions.

## Summary

This is npm package to integrate Vizury SDK in react-native 



## Getting started

`$ npm install react-native-rn-vizury-logger --save`

### Mostly automatic installation

`$ react-native link react-native-rn-vizury-logger`



## Usage
```javascript
import RnVizuryLogger from 'react-native-rn-vizury-logger';

RnVizuryLogger.addEvent({ param: 'param1', param2: "param2", param4: "param4" }, 'Vizuri Test')}
RnVizuryLogger;
```


## iOS Integration

First open terminal and go to project folder then do following steps

1. cd ios
2. pod install


## Vizury SDK Initialization

In your AppDelegate file import the VizuryEventLogger

Objective-C
objc `#import "RnVizuryLogger.h"`

Add the following in didFinishLaunchingWithOptions method of AppDelegate to initialize the SDK

   `[RnVizuryLogger initalizationVizury:application packageId:@"500" serverURL:@"https://www.vizury.com/analyze/analyze.php" cachingEnabled:true FCMEnabled:true];`

Swift
objc `#import RnVizuryLogger`

Update your AppDelegate

swift `class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate`

Add the following in didFinishLaunchingWithOptions method of AppDelegate to initialize the SDK

`RnVizuryLogger.initializeEventLogger(in: application,
            withPackageId: packageId, 
            serverURL: serverUrl,
            withCachingEnabled: caching, 
            AndWithFCMEnabled: isFCMEnabled)`


Where 
  packageId     : packageId obtained from vizury
  serverURL     : serverURL obtained from vizury
  caching       : pass true if your app supports offline usage and you want to send user behaviour data 
                  to vizury while he was offline. Pass false otherwise
  isFCMEnabled  : true/false depending on if you want to use vizury for push
Thats it!! SDK is successfully integrated and initialized in the project, and ready to use.



### Push Notifications
For sending push notifications we are using GCM-APNS interface. For this you need to configure the App for push notifications in Apple Developer Member Center and get a configuration file from google.

Configuring Apple Developer Settings
To enable sending Push Notifications through APNs, you need

a) Create the authentication key.

b) Create an App ID

c) Provisioning profile for that App ID.

You can create them in the Apple Developer Member Center by following these steps

Configuring project for FCM
Set up CocoaPods dependencies
If you don't have an Xcode project yet, create one now
Create a Podfile if you don't have one
$ cd your-project directory
$ pod init
Add the Firebase/Messaging pod
pod 'Firebase/Messaging'
Install the pods and open the .xcworkspace file to see the project in Xcode
$ pod install
$ open your-project.xcworkspace
Enabling FCM
Create a Firebase project in the Firebase console if you don't already have one. Enter the Project-Name.

<img src=“https://bytebucket.org/vizury/vizury-ios-sdk/raw/a311dc1a06a82b928939d6a2e81336c576f82a43/resources/firebase1.png">



Click on iOS option and in the next screen add the iOS Bundle Id. The iOS Bundle Id should be same as your apps bundle identifier. You can download the GoogleService-Info.plist file in the next step.


Image 

Note : The GoogleService-Info.plist file that you have downloaded will have certain settings like IS_ADS_ENABLED, IS_SIGNIN_ENABLED set as YES. You have to add 


correspinding pod dependencies for the same or you can turn them off if you are not using them
Next click on the Settings icon option of the created project.

Image

Click on Cloud Messaging tab and upload APNs Authentication Key (.p8 format). Also note down the the Server key as this will be required later during the integration. You can also upload APNs certificaties but configuration with auth keys is recommended as they are the more current method for sending notifications to iOS


Image

While uploading APNs Authentication Key (.p8 format) you need to enter the Key Id and Team Id. 1. 'Key ID' is the id of the authentication key you created in Apple developer console under Certificates, Identifiers & Profiles -> Keys -> Select the particular certificate


image


'Team ID' is the Team Member ID in Apple developer console under Membership -> Membership Details



Image


For ios react native integration you can also follow this link. 



Configuring Application
In your AppDelegate.m  file import the following 

`#import <Firebase.h>
 #import "RNFirebaseNotifications.h"
 #import "RNFirebaseMessaging.h"`
 
Drag the GoogleService-Info.plist file you just downloaded into the root of your Xcode project and add it to all targets
Register for Push notifications inside didFinishLaunchingWithOptions method of you AppDelegate.m

`
[FIRApp configure];
[RNFirebaseNotifications configure];
if([[UIDevice currentDevice] systemVersion].floatValue >= 8.0)
{
    UIUserNotificationSettings* notificationSettings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
}
else
{
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound|UIRemoteNotificationTypeBadge)];
}
`


Getting Notification from FCM


`- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
  [[RNFirebaseNotifications instance] didReceiveLocalNotification:notification];
}`

`- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
  [[RNFirebaseMessaging instance] didRegisterUserNotificationSettings:notificationSettings];
}`

`// iOS 7 or iOS 6`
`- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
  NSLog(@"token %@",token);
  [RnVizuryLogger passAPNSToken:deviceToken];
    // Send token to server
} `



`- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
[RnVizuryLogger didReceiveRemoteNotificationInApplication:application withUserInfo:userInfo];
   [[RNFirebaseNotifications instance] didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
    if(application.applicationState == UIApplicationStateInactive) {
        NSLog(@"Appilication Inactive - the user has tapped in the notification when app was closed or in background");
        [self customPushHandler:userInfo];
    }
}`


`- (void) customPushHandler:(NSDictionary *)notification {
    if (notification !=nil && [notification objectForKey:@"deeplink"] != nil) {
        NSString* deeplink = [notification objectForKey:@"deeplink"];
        NSLog(@"%@",deeplink);
        // Here based on the deeplink you can open specific screens that's part of your app
    }
}`

