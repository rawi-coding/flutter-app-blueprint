import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'app.dart';
import 'logging.dart';

void main() => run();

void run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initLogging();
  runApp(App());
}

Future<void> _initLogging() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(LogPrinter(appName: 'Flutter App Blueprint').call);
}
