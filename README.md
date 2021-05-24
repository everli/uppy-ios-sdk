# Uppy iOS SDK


[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Platform](https://img.shields.io/cocoapods/p/razorpay-pod.svg?style=flat)](https://www.apple.com/)
[![Language](https://img.shields.io/badge/Language-Swift-orange.svg)](https://swift.org/)


### Table of Contents

* [Overview](#overview)
* [SDK Installation](#sdk-installation)
  * [Using SPM](#using-spm)
  * [Using Carthage](#using-carthage)
* [SDK Setup](#sdk-setup)
  * [Swift](#swift)
  * [About params](#about-params)
* [Swift & Xcode versions support](#swift--xcode-version-support)
* [Advanced concepts](#advanced-concepts)

## Overview

Uppy iOS SDK provides api's for controlling manual & forced updates for iOS app. It is a Framework to support mobile app distribution for iOS Apps.

### Features

* **Automatic OTA Updates** when uploading new versions to Uppy.
* **Force update** if App version is lower than the minimum supported version configured in Uppy.
* **Multiple distribution** Support for app distribution through mutiple clusters.

## SDK Installation

### Using SPM

Uppy SDK provides support for Swift Package Manager. 

```bash
https://github.com/everli/uppy-ios-sdk.git
```

### Using CocoaPods

Add the following line to your's Podfile and run `pod install`. 

```ruby
target '<Your Target Name>' do
  pod 'Uppy', '~> 1.0'
end
```

## SDK Setup

At your application start up (for example in the `AppDelegate`) add the following code:

### Swift

First import the module:

``` swift
import Uppy
```
and then initialize the sdk:

``` swift
Uppy.shared.initialize(applicationID: with baseUrl: and mode: for deviceID:)
```
* **applicationID**: It is a string which provides the slug value of Uppy application on server, which is used to reference the correct url path.
* **baseUrl**: It is a string which provides the url path for the Uppy server.
* **mode**: It is an enum of type `SDKMode`, which is used during initialization for controlling the views for OTA & Forced update. There are two types of modes: 
  * native: This mode is used to show native view elements of Uppy ios sdk.
  * custom: This mode is used to present custom views for OTA alert & Forced update screen.
* **deviceID**: It is a string which provides a unique device identifier for tracking app installations.

## Advanced concepts

### Customise view for manual & force update

You can customize the update process to be fully controlled by the host app. In order to achive that, you must first initialize the sdk with `custom SDKMode`.
Then you can use the following method to return callback for manual or force update: 

```swift
func getUpdate(with completionHandler: ((_ downloadUrl: String, _ isForced: Bool) -> Void)?)
```
* **Completion handler parameters**:
  * downloadUrl: String - Contains the download link for the latest build.
  * isForced: Bool - Checks if the latest update is forced.
   
   - NOTE: Be sure to call `initialize(applicationID: with baseUrl: and mode:)` before calling this method.
   
 ### Customise strings to support multiple languages.

 You can customize & set strings values from the host app inorder to handle localisation of your app.
 Call the following method if you need to override string values which are embeded in the SDK: 

 ```swift
 func setStrings(_ strings: UppyStrings)
```
 * **UppyStrings**: It is a public struct type which is used to override default string values that are embedded in the sdk.
   
   - NOTE: When overriding if no values are passed to the `UppyStrings`type, then default english string values from SDK are used.

### Logs and debugging

In some cases you'll find usefull to see what is happening inside Uppy SDK. If so, you can change log level for debugging purposes with.

``` swift
func setLogLevel(_ logLevel: LogLevel)
```
* **LogLevel**: It is an enum which is used to contol the types of logs which are displayed for the Uppy iOS sdk. There are four types of log levels: 
  *  none: No log will be shown.
  *  error: Only warnings and errors are shown.
  *  info: Errors and relevant information is shown. This is the default log level too.
  *  debug: Requests and Responses from server are shown along with warnings & erros.
  
## Swift & Xcode version support

The compatibility version is as follow:

| Uppy Version | Xcode Version  | Swift Version |
|-------------------|----------------|---------------|
| **v1.0**          | 12.x           |  5.x |
