import 'package:app/di/di.dart';
import 'package:app/navigation/navigation.dart';
import 'package:app/splash/splash_navigator.dart';
import 'package:app/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _State();
}

class _State extends State<SplashScreen> {
  SplashNavigator? _navigator;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => SplashViewModel(sharedPreferences: DI.get()),
      dispose: (context, vm) => vm.dispose(),
      builder: (context, child) => _scaffold(context),
    );
  }

  Widget _scaffold(BuildContext context) {
    _navigator ??= SplashNavigator(viewModel: context.read(), router: context.router);
    return Scaffold(body: _body(context));
  }

  Widget _body(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: Colors.red,
      child: const CircularProgressIndicator(),
    );
  }
}
