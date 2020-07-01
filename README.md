# Flutter-Localization-Sample
This example demonstrates how to use localization in flutter application.

## Add required library under dependencies section in pubspec file
```gradle
flutter_localizations:
    sdk: flutter
```

## Create Json Files For Supported Languages

en.json For English
```json
{
  "player_name": "Player Name",
  "club_name": "Club Name",
  "country": "Country"
}
```

es.json For Spanish
```json
{
  "player_name": "Nombre del jugador",
  "club_name": "Nombre del club",
  "country": "País"
}
```

fr.json For French
```json
{
  "player_name": "Nom de joueur",
  "club_name": "Nom du club",
  "country": "Pays"
}
```

## Set Json Files Paths in pubspec file
```yaml
assets:
  - language/en.json
  - language/es.json
  - language/fr.json
```

## Create Classes For Localization
```dart
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlocalizationsample/application_localizations_delegate.dart';

class ApplicationLocalizations {
  final Locale appLocale;

  ApplicationLocalizations(this.appLocale);

  static ApplicationLocalizations of(BuildContext context) {
    return Localizations.of<ApplicationLocalizations>(context, ApplicationLocalizations);
  }

  static const LocalizationsDelegate<ApplicationLocalizations> delegate =
  ApplicationLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load JSON file from the "language" folder
    String jsonString =
    await rootBundle.loadString('assets/language/${appLocale.languageCode}.json');
    Map<String, dynamic> jsonLanguageMap = json.decode(jsonString);
    _localizedStrings = jsonLanguageMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  // called from every widget which needs a localized text
  String translate(String jsonkey) {
    return _localizedStrings[jsonkey];
  }
}
```

```dart
import 'package:flutter/material.dart';
import 'package:flutterlocalizationsample/application_localizations.dart';

class ApplicationLocalizationsDelegate extends LocalizationsDelegate<ApplicationLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const ApplicationLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'es', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<ApplicationLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    ApplicationLocalizations localizations = new ApplicationLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(ApplicationLocalizationsDelegate old) => false;
}
```

## Integrate Localization in main.dart file
```dart
      supportedLocales: [
        Locale( 'en' , 'US' ),
        Locale( 'es' , 'ES' ),
        Locale( 'fr' , 'FR' ),
      ],

      localizationsDelegates: [
        ApplicationLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale.languageCode &&
              supportedLocaleLanguage.countryCode == locale.countryCode) {
            return supportedLocaleLanguage;
          }
        }
        return supportedLocales.first;
      },
```

## Display Localized Text
```dart
Text(ApplicationLocalizations.of(context).translate("player_name"));
```
