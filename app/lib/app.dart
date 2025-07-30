import 'package:app/i18n/i18n.dart';
import 'package:flutter/material.dart';

import 'navigation/navigation.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: _appName,
      routerConfig: _appRouter.config(),
      localizationsDelegates: localizationDelegates,
      supportedLocales: supportedLocales,
    );
  }

  String _appName(BuildContext context) => context.l10n.c_app_name;
}
