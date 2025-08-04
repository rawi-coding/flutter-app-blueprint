import 'dart:io';

import 'package:app/app.dart';
import 'package:app/di/di.dart';
import 'package:app/logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logging/logging.dart';

final _log = Logger('MAIN');

void main() => run();

void run() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await _initLogging();
  await _initDependencyInjection();
  FlutterNativeSplash.remove();
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
