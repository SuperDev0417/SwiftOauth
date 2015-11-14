<p align="center">
  <img src="Assets/OAuthSwift-icon.png?raw=true" alt="OAuthSwift"/>
</p>

## OAuthSwift

[![Join the chat at https://gitter.im/dongri/OAuthSwift](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dongri/OAuthSwift?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat
            )](http://mit-license.org) [![Platform](http://img.shields.io/badge/platform-iOS_OSX-lightgrey.svg?style=flat
             )](https://developer.apple.com/resources/) [![Language](http://img.shields.io/badge/language-swift-orange.svg?style=flat
             )](https://developer.apple.com/swift) [![Cocoapod](http://img.shields.io/cocoapods/v/OAuthSwift.svg?style=flat)](http://cocoadocs.org/docsets/OAuthSwift/)  

Swift based OAuth library for iOS and OSX.


### Support OAuth1.0, OAuth2.0

Twitter, Flickr, Github, Instagram, Foursquare. Fitbit, Withings, Linkedin, Dropbox, Dribbble, Salesforce, BitBucket, GoogleDrive, Smugmug, Intuit, Zaim, Tumblr, Slack, Uber etc

### Installation

OAuthSwift is packaged as a Swift framework. Currently this is the simplest way to add it to your app:

* Drag OAuthSwift.xcodeproj to your project in the Project Navigator.
* Select your project and then your app target. Open the Build Phases panel.
* Expand the Target Dependencies group, and add OAuthSwift framework.
* import OAuthSwift whenever you want to use OAuthSwift.

### Support Carthage

* Install Carthage (https://github.com/Carthage/Carthage)
* Create Cartfile file
```
github "dongri/OAuthSwift" ~> 0.4.6
```
* Run `carthage update`.
* On your application targets’ “General” settings tab, in the “Embedded Binaries” section, drag and drop OAuthSwift.framework from the Carthage/Build/iOS folder on disk.

### Support CocoaPods

* Podfile
```
platform :ios, '8.0'
use_frameworks!

pod "OAuthSwift", "~> 0.4.6"
```

### Setting URL Schemes

![Image](Assets/URLSchemes.png "Image")

### Examples

```swift
// AppDelegate
func application(application: UIApplication!, openURL url: NSURL!, sourceApplication: String!, annotation: AnyObject!) -> Bool {
  if (url.host == "oauth-callback") {
    if (url.path!.hasPrefix("/twitter")){
      OAuth1Swift.handleOpenURL(url)
    }
    if ( url.path!.hasPrefix("/github" )){
      OAuth2Swift.handleOpenURL(url)
    }
  }
  return true
}

// OAuth1.0
let oauthswift = OAuth1Swift(
    consumerKey:    "********",
    consumerSecret: "********",
    requestTokenUrl: "https://api.twitter.com/oauth/request_token",
    authorizeUrl:    "https://api.twitter.com/oauth/authorize",
    accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
)
oauthswift.authorizeWithCallbackURL( NSURL(string: "oauth-swift://oauth-callback/twitter"), success: {
    credential, response in
    println(credential.oauth_token)
    println(credential.oauth_token_secret)
}, failure: failureHandler)

// OAuth2.0
let oauthswift = OAuth2Swift(
    consumerKey:    "********",
    consumerSecret: "********",
    authorizeUrl:   "https://api.instagram.com/oauth/authorize",
    responseType:   "token"
)
oauthswift.authorizeWithCallbackURL( NSURL(string: "oauth-swift://oauth-callback/instagram"), scope: "likes+comments", state:"INSTAGRAM", success: {
    credential, response, parameters in
    println(credential.oauth_token)
}, failure: failureHandler)

```

### OAuth pages

* [Twitter](https://dev.twitter.com/docs/auth/oauth)  
* [Flickr](https://www.flickr.com/services/api/auth.oauth.html)  
* [Github](https://developer.github.com/v3/oauth)  
* [Instagram](http://instagram.com/developer/authentication)  
* [Foursquare](https://developer.foursquare.com/overview/auth)  
* [Fitbit](https://wiki.fitbit.com/display/API/OAuth+Authentication+in+the+Fitbit+API)  
* [Withings](http://oauth.withings.com/api)  
* [Linkedin](https://developer.linkedin.com/documents/authentication)  
* [Dropbox](https://www.dropbox.com/developers/core/docs)  
* [Dribbble](http://developer.dribbble.com/v1/oauth/)
* [Salesforce](https://www.salesforce.com/us/developer/docs/api_rest/)
* [BitBucket](https://confluence.atlassian.com/display/BITBUCKET/OAuth+on+Bitbucket)
* [GoogleDrive](https://developers.google.com/drive/v2/reference/)
* [Smugmug](https://smugmug.atlassian.net/wiki/display/API/OAuth)
* [Intuit](https://developer.intuit.com/docs/0100_accounting/0060_authentication_and_authorization/oauth_management_api)
* [Zaim](https://dev.zaim.net/home/api/authorize)
* [Tumblr](https://www.tumblr.com/docs/en/api/v2#auth)
* [Slack](https://api.slack.com/docs/oauth)
* [Uber](https://developer.uber.com/v1/auth/)

### Images

![Image](Assets/Services.png "Image")
![Image](Assets/TwitterOAuth.png "Image")
![Image](Assets/TwitterOAuthTokens.png "Image")

## License

OAuthSwift is available under the MIT license. See the LICENSE file for more info.
