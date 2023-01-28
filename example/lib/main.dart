import 'package:flutter/material.dart';
import 'package:flutter_with_persona/flutter_with_persona.dart';

void main() {
  runApp(const Example());
}

class Example extends StatefulWidget {
  final String templateId = '<TEMPLATE_ID>';
  final String name = '<NAME>';
  final String lastName = '<LASTNAME>';

  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  late final FlutterWithPersonaOptions withPersonaOptions =
      FlutterWithPersonaOptions(
    templateId: widget.templateId,
    fields: FlutterWithPersonaFields(
      name: widget.name,
      lastName: widget.lastName,
    ),
  );

  Future<void> authWithPersonaV2() async =>
      FlutterWithPersona.auth(withPersonaOptions);

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Material(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.0),
            surfaceTintColor: Colors.deepPurple,
            child: InkWell(
              onTap: authWithPersonaV2,
              splashColor: Colors.deepPurple,
              highlightColor: Colors.deepPurpleAccent,
              hoverColor: Colors.deepPurpleAccent,
              focusColor: Colors.deepPurpleAccent,
              child: SizedBox(
                height: 80.0,
                width: mediaSize.width * 0.8,
                child: Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Auth With Persona V2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
