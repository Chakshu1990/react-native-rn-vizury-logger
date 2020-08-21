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

// TODO: What to do with the module?
RnVizuryLogger;
```


## iOS Integration

First open terminal and go to project folder then do following steps

1. cd ios
2. pod install


## Vizury SDK Initialization

In your AppDelegate file import the VizuryEventLogger

Objective-C
objc #import "RnVizuryLogger.h"

Add the following in didFinishLaunchingWithOptions method of AppDelegate to initialize the SDK

   [RnVizuryLogger initalizationVizury:application packageId:@"500" serverURL:@"https://www.vizury.com/analyze/analyze.php" cachingEnabled:true FCMEnabled:true];

Swift
objc #import RnVizuryLogger

Update your AppDelegate

swift class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate

Add the following in didFinishLaunchingWithOptions method of AppDelegate to initialize the SDK

RnVizuryLogger.initializeEventLogger(in: application,
            withPackageId: packageId, 
            serverURL: serverUrl,
            withCachingEnabled: caching, 
            AndWithFCMEnabled: isFCMEnabled)
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


Sample Image

Click on iOS option and in the next screen add the iOS Bundle Id. The iOS Bundle Id should be same as your apps bundle identifier. You can download the GoogleService-Info.plist file in the next step.


Image 

Note : The GoogleService-Info.plist file that you have downloaded will have certain settings like IS_ADS_ENABLED, IS_SIGNIN_ENABLED set as YES. You have to add 


correspinding pod dependencies for the same or you can turn them off if you are not using them
Next click on the Settings icon option of the created project.



