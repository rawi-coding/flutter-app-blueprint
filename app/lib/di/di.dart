library;

import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:persons/component.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _log = Logger('DI');

class DI {
  const DI._();

  static Future<void> init() {
    _log.info('Initialize dependency injection');

    final getIt = GetIt.I
      .._registerSharedPreferences()
      .._registerPersonRepo();

    return getIt.allReady();
  }

  static T get<T extends Object>({String? instanceName, dynamic param1, dynamic param2}) {
    return GetIt.I.get(instanceName: instanceName, param1: param1, param2: param2);
  }
}

extension _AppComponentGetItX on GetIt {
  void _registerSharedPreferences() {
    _log.info('Register shared preferences');
    Future<SharedPreferences> factoryFunc() async => SharedPreferences.getInstance();
    registerSingletonAsync(factoryFunc);
  }

  void _registerPersonRepo() {
    _log.info('Register person repository');
    factoryFunc() => PersonsComponent.createLocalRepo();
    registerSingleton<PersonsLocalRepo>(factoryFunc());
  }
}
