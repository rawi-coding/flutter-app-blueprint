import 'package:app/i18n/i18n.dart';
import 'package:app/navigation/navigation.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.c_app_name)),
      body: Center(child: Text('Hello World')),
    );
  }
}
