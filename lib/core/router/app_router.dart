import 'package:auto_route/auto_route.dart';

import 'package:hubx_example/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:hubx_example/features/home/presentation/pages/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        // HomeScreen is generated as HomeRoute because
        // of the replaceInRouteName property
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
