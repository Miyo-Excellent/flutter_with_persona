import 'dart:convert';
import 'package:flutter/services.dart';

part './flutter_with_persona_fields.dart';
part './flutter_with_persona_options.dart';

/// This is the name of the channel that will be used to communicate with the native
/// code.
const String _channelName = 'flutter_with_persona';

/// This is the name of the method that will be used to communicate with the native
/// code.
const String _methodName = 'flutter_with_persona_invoke';

/// It's a singleton that provides a method to call the native code
class FlutterWithPersona {
  /// `_instance` is a static variable that is initialized to `null` and is of type
  /// `FlutterWithPersona`.
  ///
  /// `_instance` is initialized to a new instance of `FlutterWithPersona` if it is `null`
  factory FlutterWithPersona() => _instance;

  /// It's a private constructor.
  FlutterWithPersona._();

  /// It's a singleton.
  static final _instance = FlutterWithPersona._();

  /// It's creating a `MethodChannel` object that will be used to communicate with
  /// the native code.
  static const MethodChannel methodChannel = MethodChannel(_channelName);

  /// "Call the `auth` method on the `withPersona` channel, passing in the
  /// `FlutterWithPersonaOptions` object."
  ///
  /// The `FlutterWithPersonaOptions` object is a Dart class that contains the options that
  /// you want to pass to the `auth` method
  ///
  /// Args:
  ///   options (FlutterWithPersonaOptions): A map of options that can be passed to the
  /// Persona SDK.
  static Future<void> auth(FlutterWithPersonaOptions options) async {
    /// It's calling the `auth` method on the `withPersona` channel, passing in the
    /// `FlutterWithPersonaOptions` object.
    await methodChannel.invokeMethod<void>(_methodName, [options]);
  }
}
