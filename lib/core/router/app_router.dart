import 'package:auto_route/auto_route.dart';

import 'package:hubx_example/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:hubx_example/features/home/presentation/pages/home_page.dart';
import 'package:hubx_example/features/paywall/presentation/pages/paywall_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        CustomRoute(
          page: PaywallRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          duration: const Duration(milliseconds: 400),
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
