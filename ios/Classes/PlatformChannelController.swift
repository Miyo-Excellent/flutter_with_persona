//
//  PlatformChannels.swift
//  Runner
//
//  Created by Michell Excellent on 14/10/22.
//

import Foundation
import Persona2

// A enum that is used to define the channel name.
enum PlatformChannelName {
    case persona
}

// This is the class that is used to setup the channel.
class PlatformChannelController {
    // This is the theme that is used to customize the UI of the Persona SDK.
    let theme = InquiryTheme()
    // The name of the channel that is used to communicate with the Flutter side.
    let channelName: String
    let methodName: String

    // This is the controller that is used to communicate with the Flutter side.
    let controller: FlutterViewController
    
    // This is the controller that is used to communicate with the Flutter side.
    var channel: FlutterMethodChannel {
        // This is the controller that is used to communicate with the Flutter side.
        return FlutterMethodChannel(
            name: self.channelName,
            binaryMessenger: self.controller.binaryMessenger
        )
    }
    
    // This is the constructor of the class.
    init(
        name channelName: String,
        method methodName: String,
        controller: FlutterViewController
    ) {
        // Setting the channel name.
        self.channelName = channelName
        self.methodName = methodName
        // Setting the controller that is used to communicate with the Flutter side.
        self.controller = controller
    }
    
    // This is the function that is used to setup the channel.
    func setup() {
        // This is the function that is used to setup the channel.
        self.channel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                // This is a way to validate the arguments that are passed from the Flutter side.
                guard let arguments: [Any] = call.arguments as? [Any]
                else { fatalError("The arguments <any> are required") }

                // This is a way to validate the arguments that are passed from the Flutter side.
                guard let data: [String:Any] = arguments.first as? [String:Any]
                else { fatalError("The arguments dont has a first value <Any> required") }
            
                // This is a way to validate the arguments that are passed from the Flutter side.
                guard let templateId: String = data["templateId"] as? String
                else { fatalError("The template ID is required") }
            
                // This is a way to validate the arguments that are passed from the Flutter side.
                guard let fieldsRaw: [String:Any] = data["fields"] as? [String:Any]
                else { fatalError("The fields <Any> in the arguments are required") }
            
                // This is a way to validate the arguments that are passed from the Flutter side.
                guard let lastName: String = fieldsRaw["lastName"] as? String
                else { fatalError("The first last name <String> in the arguments fields is required") }

                // This is a way to validate the arguments that are passed from the Flutter side.
                guard let name: String = fieldsRaw["name"] as? String
                else { fatalError("The first name <String> in the arguments fields is required") }
            
                // This is a way to validate the arguments that are passed from the Flutter side.
                guard let isProduction: Bool = data["isProduction"] as? Bool
                else { fatalError("The is production <String> prop is required") }
            
                // This is a way to validate if the SDK is in production mode or not.
                if (!isProduction) { print("Persona Is In SandBox Mode") }
            
                // This is the function that is used to setup the channel.
                switch call.method {
                    // This is the function that is used to setup the channel.
                    case PersonaPlatformChannel.methodName:
                        // This is the configuration that is used to setup the SDK.
                        let config: InquiryConfiguration = InquiryConfiguration(
                            templateId: templateId,
                            environment: isProduction ? .production : .sandbox,
                            fields: [
                                "name_first": .string(name),
                                "name_last": .string(lastName)
                            ]
                        )

                        // This is the class that is used to setup the channel.
                        let persona: PersonaPlatformChannel = PersonaPlatformChannel(
                            config: config,
                            controller: self.controller
                        )

                        // Calling the `run()` function that is defined in the `PersonaPlatformChannel`
                        // class.
                        persona.run()
                        break
                    default: break
                }
        })
    }
}
