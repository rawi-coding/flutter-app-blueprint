import 'package:app/navigation/navigation.dart';
import 'package:app/splash/splash_view_model.dart';
import 'package:logging/logging.dart';

final _log = Logger('SplashNavigator');

class SplashNavigator {
  SplashNavigator({required this.viewModel, required this.router}) {
    _init();
  }

  final SplashViewModel viewModel;
  final StackRouter router;

  void _init() {
    _checkOnboarding();
  }

  Future<void> _checkOnboarding() async {
    _log.fine('Check onboarding state');
    final onboardingFinished = viewModel.onboardingFinished;
    if (onboardingFinished) {
      _navigateToHome();
    } else {
      _navigateToOnboarding();
    }
  }

  Future<void> _navigateToHome() async {
    _log.fine('Navigate to home');
    try {
      final route = HomeRoute();
      router.replaceAll([route]);
    } catch (e, s) {
      _log.warning('Navigate to home failed', e, s);
    }
  }

  Future<void> _navigateToOnboarding() async {
    _log.fine('Navigate to login');
    try {
      final route = OnboardingRoute();
      router.replaceAll([route]);
    } catch (e, s) {
      _log.warning('Navigate to onboarding failed', e, s);
    }
  }
}