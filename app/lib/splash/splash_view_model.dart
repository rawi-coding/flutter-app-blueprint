import 'package:app/onboarding/onboarding_view_model.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _log = Logger('SplashViewModel');

class SplashViewModel {
  SplashViewModel({required SharedPreferences sharedPreferences}) : _preferences = sharedPreferences;

  final SharedPreferences _preferences;

  bool get onboardingFinished => _preferences.getBool(onboardingCompleteKey) ?? false;

  void dispose() {
    _log.fine('Dispose');
  }
}