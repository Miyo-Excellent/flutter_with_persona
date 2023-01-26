# WithPersona V2 Flutter Plugin

This is a Flutter plugin that allows you to integrate WithPersona V2 SDK into your Flutter project.

## Getting Started

To use this plugin, add `with_persona_v2` as a dependency in your pubspec.yaml file.

### Prerequisites

- WithPersona SDK version 2.0.0 or higher. You can download it from the [WithPersona website](https://docs.withpersona.com/docs)

### Installing

1. Go to the WithPersona website and download the latest version of the WithPersona SDK.

2. Follow the instructions provided in the [SDK documentation](https://docs.withpersona.com/docs) to install it in your iOS or Android project.

3. Import the plugin in your Dart code:
```dart  
import 'package:with_persona_v2/with_persona_v2.dart';
`````  

4. Use the `WithPersonaV2` class to interact with the SDK.
```dart  
WithPersonaV2.runPersona(config: PersonaConfigParams());  
```

5. Make sure the SDK is installed and configured correctly in your iOS or Android project.

### Example

Check out the example directory for a sample app using WithPersona V2 Flutter Plugin.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Michell Excellent Marin** - *JavaScript | TypeScript | Dart | kotlin | Swift* - [GitHub](https://github.com/Miyo-Excellent)

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE.md](LICENSE.)