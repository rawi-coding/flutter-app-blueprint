import 'package:app/navigation/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [_splash, _home, _onboarding];
}

final _splash = AutoRoute(page: SplashRoute.page, path: '/', initial: true);

final _home = AutoRoute(page: HomeRoute.page, path: '/home');

final _onboarding = AutoRoute(page: OnboardingRoute.page, path: '/onboarding');
