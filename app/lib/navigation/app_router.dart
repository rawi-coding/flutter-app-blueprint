import 'package:app/navigation/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [_home];
}

// Main routes

final _home = AutoRoute(page: HomeRoute.page, path: '/', initial: true);