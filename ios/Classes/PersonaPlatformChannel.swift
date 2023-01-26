//
//  PersonaPlatformChannel.swift
//  Runner
//
//  Created by Michell Excellent on 22/01/23.
//

import Foundation
import Persona2

/// Errors that can occur clientside during the inquiry flow which result in the inquiryError callback
public enum PersonaError: Error, CustomDebugStringConvertible {
    /// An api error or connectivity error occurred
    case networking
    /// Failed to get a context to the device camera
    case camera
    /// Permissions have been denied or incorrectly configured
    case permissions
    /// The corresponding template is misconfigured
    case misconfigured(InquiryConfigurationError)
    /// An otherwise unexpected or unhandled error occurred
    case other

    /// A short debug description for why the persona sdk errored
    public var debugDescription: String {
        switch self {
        case .networking:
            return "There was a problem reaching the server."
        case .misconfigured(let error):
            return error.errorDescription ?? "There was a problem with the template configuration."
        case .camera:
            return "There was a problem establishing a connection to the camera."
        case .permissions:
            return "Permissions have been denied or incorrectly configured."
        case .other:
            return "An otherwise unexpected error occurred."
        }
    }
}

/// Client side InquiryConfiguration errors
public enum InquiryConfigurationError: Error {
    /// Inquiry Template Id does not match known structure
    case invalidTemplateId(String)
    /// Inquiry Template Version does not match known structure
    case invalidTemplateVersion(String)
    /// This version of the SDK does not support Inquiry Template Ids with supplied prefix
    case prefixSDKVersionMismatch(String)
    /// The template configuration from server was not valid
    case serverConfiguration
}

extension InquiryConfigurationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidTemplateId(let templateId):
            return "Could not start Inquiry for templateId: \(templateId). Does not match Inquiry Template Id structure."
        case .invalidTemplateVersion(let templateVersion):
            return "Could not start Inquiry for templateVersion: \(templateVersion). Does not match Inquiry Template Version structure."
        case .prefixSDKVersionMismatch(let prefix):
            return "Inquiry Template Ids with prefix: \(prefix) are only valid in v1.x.x of SDK."
        case .serverConfiguration:
            return "There was a problem with the template configuration on the server."
        }
    }
}

// A class that is used to create an instance of the Persona SDK.
class PersonaPlatformChannel: InquiryDelegate {
    // This is a static variable that is used to identify the channel.
    static let channelName: String = "persona"
    
    // A reference to the FlutterViewController that is used to present the Persona SDK.
    let viewController: FlutterViewController
    
    /* EXAMPLE
        let config = InquiryConfiguration(
            templateId: "TEMPLATE_ID",
            referenceId: "myUser_123",
            fields: [
                "name_first": .string("Susan"),
                "name_last": .string("Realman")
            ],
            sessionToken: "ABD1234567890"
        )
     */
    // A configuration object that is used to configure the inquiry.
    let config: InquiryConfiguration
    
    // Initializing the class.
    init(
        config: InquiryConfiguration,
        controller viewController: FlutterViewController
    ) {
        self.config = config
        self.viewController = viewController
    }
    
    // This is the function that is called when the user clicks the button.
    func run() -> Void {
        // Creating an instance of the Inquiry class and calling the start function.
        Inquiry(config: config, delegate: self)
            .start(from: self.viewController)
    }
    
    // This is the function that is called when the user clicks the button.
    func inquiryComplete(
        inquiryId: String,
        status: String,
        fields: [String:InquiryField]
    ) -> Void {
            // Inquiry completed
        print(inquiryId)
        print(status)
        print(fields)
    }
    
    // This is the function that is called when the user clicks the button.
    func inquiryCanceled(inquiryId: String?, sessionToken: String?) -> Void {
        // Inquiry cancelled by user
        // This is a way to unwrap an optional value.
        if inquiryId != nil { print(inquiryId!) }
        // This is a way to unwrap an optional value.
        if sessionToken != nil { print(sessionToken!) }
    }
    
    // This is a function that is called when the inquiry fails.
    func inquiryError(_ error: Error) -> Void {
        // Inquiry errored
        print(error)
    }
}
