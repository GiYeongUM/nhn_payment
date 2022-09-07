import Flutter
import UIKit

public class SwiftNhnPaymentPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "nhn_payment", binaryMessenger: registrar.messenger())
    let instance = SwiftNhnPaymentPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    channel.setMethodCallHandler({(call: FlutterMethodCall, result: FlutterResult) -> Void in
      // Note: this method is invoked on the UI thread.
     
        switch call.method {
        case "intent":
                let args = call.arguments as? Dictionary<String, String>
                print(args?["url"])
                guard let url = URL(string: args?["url"] ?? "") else {
                    return
                }
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url)
                }
             return
        default:
            result(FlutterMethodNotImplemented)
        }
    })
  }

  public func handle(_ call: FlutterMethodCall) {
        let args = call.arguments as? Dictionary<String, String>
        guard let url = URL(string: args?["url"] ?? "") else {
          return
        }
        if #available(iOS 10.0, *) {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
         } else {
           UIApplication.shared.openURL(url)
         }
         return
  }
}
