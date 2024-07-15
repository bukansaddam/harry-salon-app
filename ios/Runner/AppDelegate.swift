import Flutter
import UIKit
import GoogleMaps  

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    GMSServices.provideAPIKey("AIzaSyDp_NzxrwKSMBjnoyMh5joJW4jZU-iITOw")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
