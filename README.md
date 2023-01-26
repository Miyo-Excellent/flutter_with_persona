


# Flutter With Persona
[![Persona](https://assets.website-files.com/5ed53a66afe689695e9a832e/5fd2c5780f7a60098dedfc54_persona-opengraph.png)](https://withpersona.com/) [![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://docs.withpersona.com/docs/android-sdk-v2-integration-guide) [![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)](https://docs.withpersona.com/docs/ios-sdk-v2-integration-guide) [![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://docs.flutter.dev/development/platform-integration/platform-channels?tab=type-mappings-kotlin-tab) [![GitHub Project](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/Miyo-Excellent/flutter_with_persona)

Is a Flutter plugin that allows you to easily integrate [With Persona](https://withpersona.com/) authentication into your Flutter app. With this plugin, you can log in to [With Persona](https://withpersona.com/) and retrieve information about the authenticated user, all without leaving your app. The plugin also provides options to customize the [With Persona](https://withpersona.com/) login experience, such as selecting the desired language and specifying which user information fields you want to receive. This plugin is compatible with both Android and iOS.  
With this plugin, you can easily and quickly integrate [With Persona](https://withpersona.com/) into your Flutter app and provide your users with an easy way to log in.

## Requirements for installing the plugin
- Have a [With Persona](https://withpersona.com/) account
- Have a Flutter project created
- Follow the installation prerequisites for IOS and Android specified in the [With Persona official documentation](https://docs.withpersona.com/docs)
    *  [![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://docs.withpersona.com/docs/android-sdk-v2-integration-guide)
    * [![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)](https://docs.withpersona.com/docs/ios-sdk-v2-integration-guide)

## Installation
1. Add `flutter_with_persona` as a dependency in your project's `pubspec.yaml` file:
```  
dependencies:  
 flutter_with_persona: <latest_version>
 ```  
2. Run `flutter packages get` in the terminal to update your project's dependencies.

## Usage
1. Import the package in your project's `main.dart` file:
```dart  
import 'package:flutter_with_persona/flutter_with_persona.dart';
```  
2. Use the `WithPersona` class to log in, log out, and check the current login status:
```dart  
WithPersona.auth();  
```  
3. Use the `Button` class to display a login button in the app:
```dart  
Button(onPress: WithPersona.auth);  
```  

## Note
Make sure to follow the [official documentation](https://docs.withpersona.com/docs) to correctly set up the WithPersona plugin in your project before using this plugin.  
Also, make sure to follow WithPersona's privacy policies in your project. Be sure to follow the installation prerequisites for IOS and Android specified in the official documentation before attempting to use the plugin in a project.

## Author

**Michell Excellent Marin** - *Developer with JavaScript | TypeScript | Dart | kotlin | Swift* - [![LinkedIn](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white) ](https://www.linkedin.com/in/michellexcellent) [![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) ](https://github.com/Miyo-Excellent)


## License

[![Licence](https://img.shields.io/github/license/Ileriayo/markdown-badges?style=for-the-badge)](./LICENSE)