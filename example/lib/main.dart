import 'package:flutter/material.dart';

import 'package:flutter_with_persona/flutter_with_persona.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final FlutterWithPersonaOptions _withPersonaOptions =
      FlutterWithPersonaOptions(
    templateId: '',
    fields: FlutterWithPersonaFields(name: '', lastName: ''),
  );

  Future<void> withPersonaAuth() async =>
      FlutterWithPersona.auth(_withPersonaOptions);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MaterialButton(
            onPressed: withPersonaAuth,
            child: const Center(child: Text('Auth With Persona V2')),
          ),
        ),
      ),
    );
  }
}
