import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: false)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
