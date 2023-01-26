import Flutter
import UIKit

public class SwiftFlutterWithPersonaPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = SwiftFlutterWithPersonaPlugin()

    guard let inputViewController: FlutterViewController = window.rootViewController as? FlutterViewController
    else { fatalError("Invalid View Controller") }

    let platformChannelController: PlatformChannelController = PlatformChannelController(
      name: "with_persona",
      method: "flutter_with_persona_invoke",
      controller: inputViewController
    )

    platformChannelController.setup()

    registrar.addMethodCallDelegate(instance, channel: platformChannelController.channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
