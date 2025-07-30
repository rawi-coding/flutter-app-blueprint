import 'package:app/di/di.dart';
import 'package:app/navigation/navigation.dart';
import 'package:app/onboarding/onboarding_view_model.dart';
import 'package:app/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

final _log = Logger('OnboardingScreen');

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => OnboardingViewModel(sharedPreferences: DI.get()),
      dispose: (context, vm) => vm.dispose(),
      builder: (context, child) => _scaffold(context),
    );
  }

  Widget _scaffold(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text('Onboarding'),
            Spacer(),
            OutlinedButton(onPressed: () => _onContinuePressed(context), child: Text('Weiter')),
          ],
        ),
      ),
    );
  }

  void _onContinuePressed(BuildContext context) async {
    try {
      await context.read<OnboardingViewModel>().finishOnboarding();
      if (context.mounted) {
        _navigateToSplash(context);
      }
    } catch (e) {
      _log.severe('Finish onboarding failed with error: $e');
    }
  }

  Future<void> _navigateToSplash(BuildContext context) async {
    _log.fine('Navigate to splash');
    try {
      final route = SplashRoute();
      context.router.replaceAll([route]);
    } catch (e, s) {
      _log.warning('Navigate to splash failed', e, s);
    }
  }
}
