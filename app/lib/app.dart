import 'package:app/i18n/i18n.dart';
import 'package:app/navigation/navigation.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ThemeViewModel(),
      dispose: (context, vm) => vm.dispose(),
      builder: (context, _) {
        return StreamBuilder(
          initialData: ThemeViewModel.defaultMode,
          stream: context.read<ThemeViewModel>().themeMode,
          builder: (context, snapshot) {
            final themeMode = snapshot.requireData;
            return MaterialApp.router(
              onGenerateTitle: _appName,
              routerConfig: _appRouter.config(),
              localizationsDelegates: localizationDelegates,
              supportedLocales: supportedLocales,
              themeMode: themeMode,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
            );
          },
        );
      },
    );
  }

  String _appName(BuildContext context) => context.l10n.c_app_name;
}
