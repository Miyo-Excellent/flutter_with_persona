// To parse this JSON data, do
//
//     final flutterWithPersonaOptions = flutterWithPersonaOptionsFromJson(jsonString);

part of './flutter_with_persona.dart';

/// `FlutterWithPersonaOptions.fromJson(json.decode(str))`
///
/// The `json.decode(str)` function takes a JSON string and converts it to a Dart
/// object
///
/// Args:
///   str (String): The JSON string to be decoded.
FlutterWithPersonaOptions flutterFlutterWithPersonaOptionsFromJson(
  String str,
) =>
    FlutterWithPersonaOptions.fromJson(json.decode(str));

/// It takes a Dart object and returns a JSON string
///
/// Args:
///   data (FlutterWithPersonaOptions): The data to be serialized.
String flutterWithPersonaOptionsToJson(FlutterWithPersonaOptions data) =>
    json.encode(data.toJson());

/// It's a Dart class that represents the JSON object that we'll be sending to the
/// server
class FlutterWithPersonaOptions {
  /// It's a constructor that takes in the required parameters.
  FlutterWithPersonaOptions({
    required this.templateId,
    required this.fields,
    bool isProduction = false,
  }) : _isProduction = isProduction;

  /// It's a variable that is final, meaning it can't be changed. It's a String,
  /// meaning it's a sequence of characters. It's called templateId, meaning it's
  /// the name of the variable.
  final String templateId;

  /// It's a variable that is final, meaning it can't be changed. It's a bool,
  /// meaning it's a boolean value. It's called _isProduction, meaning it's the name
  /// of
  /// the variable.
  final bool _isProduction;

  /// It's a variable that is final, meaning it can't be changed. It's a
  /// FlutterWithPersonaFields, meaning it's a Dart class. It's called fields, meaning it's
  /// the
  /// name of the variable.
  final FlutterWithPersonaFields fields;

  /// It creates a copy of the FlutterWithPersonaOptions class with the new values.
  ///
  /// Args:
  ///   templateId (String): The template ID of the template you want to use.
  ///   _isProduction (bool): This is a boolean value that determines whether the
  /// template is in production or not.
  ///   fields (FlutterWithPersonaFields): This is a map of the fields that you want to
  /// fill in the template.
  FlutterWithPersonaOptions copyWith({
    required String templateId,
    bool isProduction = false,
    required FlutterWithPersonaFields fields,
  }) =>
      FlutterWithPersonaOptions(
        templateId: templateId,
        isProduction: isProduction,
        fields: fields,
      );

  /// A factory constructor that creates a new FlutterWithPersonaOptions object from a JSON
  /// map.
  ///
  /// Args:
  ///   json (Map<String, dynamic>): The JSON object that you want to convert to a
  /// FlutterWithPersonaOptions object.
  factory FlutterWithPersonaOptions.fromJson(Map<String, dynamic> json) =>
      FlutterWithPersonaOptions(
        templateId: json["templateId"],
        isProduction: json["isProduction"],
        fields: json["fields"],
      );

  /// It converts the object to a JSON object.
  Map<String, dynamic> toJson() => {
        "templateId": templateId,
        "isProduction": _isProduction,
        "fields": fields,
      };
}
