import 'package:app/i18n/i18n.dart';
import 'package:app/navigation/navigation.dart';
import 'package:app/theme/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(child: Text('Hello World')),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(context.l10n.c_app_name),
      actions: [
        IconButton(
          icon: const Icon(Icons.dark_mode),
          onPressed: () {
            context.read<ThemeViewModel>().toggleTheme(context);
          },
        ),
      ],
    );
  }
}
