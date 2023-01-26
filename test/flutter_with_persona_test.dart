import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_with_persona/flutter_with_persona.dart';
import 'package:flutter_with_persona/flutter_with_persona_platform_interface.dart';
import 'package:flutter_with_persona/flutter_with_persona_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterWithPersonaPlatform
    with MockPlatformInterfaceMixin
    implements FlutterWithPersonaPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterWithPersonaPlatform initialPlatform = FlutterWithPersonaPlatform.instance;

  test('$MethodChannelFlutterWithPersona is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterWithPersona>());
  });

  test('getPlatformVersion', () async {
    FlutterWithPersona flutterWithPersonaPlugin = FlutterWithPersona();
    MockFlutterWithPersonaPlatform fakePlatform = MockFlutterWithPersonaPlatform();
    FlutterWithPersonaPlatform.instance = fakePlatform;

    expect(await flutterWithPersonaPlugin.getPlatformVersion(), '42');
  });
}
