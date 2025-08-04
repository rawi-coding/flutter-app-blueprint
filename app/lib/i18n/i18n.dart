import 'package:app/i18n/gen/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

export 'gen/app_localizations.dart';
export 'src/build_context_x.dart';

const localizationDelegates = <LocalizationsDelegate<dynamic>>[
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const supportedLocales = [
  Locale('en', ''),
];
