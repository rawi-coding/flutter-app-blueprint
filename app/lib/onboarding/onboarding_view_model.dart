import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _log = Logger('OnboardingViewModel');

const onboardingCompleteKey = 'onboarding_complete';

class OnboardingViewModel {
  OnboardingViewModel({required SharedPreferences sharedPreferences}) : _preferences = sharedPreferences;

  final SharedPreferences _preferences;

  Future<void> finishOnboarding() async {
    await _preferences.setBool(onboardingCompleteKey, true);
  }

  void dispose() {
    _log.fine('Dispose');
  }
}
