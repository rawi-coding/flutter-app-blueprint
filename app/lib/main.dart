import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'app.dart';
import 'di/di.dart';
import 'logging.dart';

final _log = Logger('MAIN');

void main() => run();

void run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initLogging();
  await _initDependencyInjection();
  runApp(App());
}

Future<void> _initLogging() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(LogPrinter(appName: 'Flutter App Blueprint').call);
}

Future<void> _initDependencyInjection() async {
  try {
    await DI.init();
  } catch (e, s) {
    _log.severe('Dependency injection initialization failed', e, s);
    exit(1);
  }
}
