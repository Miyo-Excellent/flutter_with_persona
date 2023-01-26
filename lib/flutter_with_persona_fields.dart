// To parse this JSON data, do
//
//     final flutterWithPersonaFields = flutterWithPersonaFieldsFromJson(jsonString);

part of './flutter_with_persona.dart';

/// `FlutterWithPersonaFields flutterFlutterWithPersonaFieldsFromJson(String str) =>
/// FlutterWithPersonaFields.fromJson(json.decode(str));`
///
/// The function takes a string as an argument and returns a `FlutterWithPersonaFields`
/// object
///
/// Args:
///   str (String): The JSON string to be decoded.
FlutterWithPersonaFields flutterFlutterWithPersonaFieldsFromJson(String str) =>
    FlutterWithPersonaFields.fromJson(json.decode(str));

/// It takes a FlutterWithPersonaFields object and returns a JSON string
///
/// Args:
///   data (FlutterWithPersonaFields): The data to be converted to JSON.
String flutterFlutterWithPersonaFieldsToJson(FlutterWithPersonaFields data) =>
    json.encode(data.toJson());

/// `FlutterWithPersonaFields` is a class that has a `name` and a `lastName` field
class FlutterWithPersonaFields {
  /// A constructor that takes two arguments, `name` and `lastName`, and assigns
  /// them to the class fields.
  FlutterWithPersonaFields({required this.name, required this.lastName});

  /// Declaring a variable called `name` of type `String` and making it final.
  final String name;

  /// Declaring a variable called `lastName` of type `String` and
  /// making it final.
  final String lastName;

  /// CopyWith returns a new instance of FlutterWithPersonaFields with the given values,
  /// and the rest of the values from the original instance.
  ///
  /// Args:
  ///   name (String): The name of the field.
  ///   lastName (String): The last name of the person.
  FlutterWithPersonaFields copyWith({
    required String name,
    required String lastName,
  }) =>
      FlutterWithPersonaFields(name: name, lastName: lastName);

  /// It takes a JSON object and returns a new instance of the class
  ///
  /// Args:
  ///   json (Map<String, dynamic>): The JSON object that you want to convert to a
  /// Dart object.
  factory FlutterWithPersonaFields.fromJson(Map<String, dynamic> json) =>
      FlutterWithPersonaFields(name: json["name"], lastName: json["lastName"]);

  /// It converts the object to a JSON object.
  Map<String, dynamic> toJson() => {"name": name, "lastName": lastName};
}
