import UIKit
import Flutter
import KakaoSDKCommon
import KakaoSDKAuth
import NaverThirdPartyLogin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }
        if (NaverThirdPartyLoginConnection.getSharedInstance().isNaverThirdPartyLoginAppschemeURL(url)) {
            return NaverThirdPartyLoginConnection.getSharedInstance().application(app, open: url, options: options)
        }
        return super.application(app, open: url, options: options)
    }
}
