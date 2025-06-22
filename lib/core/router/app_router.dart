import 'package:auto_route/auto_route.dart';

import 'package:hubx_example/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:hubx_example/features/diagnose/presentation/pages/diagnose_page.dart';
import 'package:hubx_example/features/home/presentation/pages/home_page.dart';
import 'package:hubx_example/features/my_garden/presentation/pages/my_garden_page.dart';
import 'package:hubx_example/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:hubx_example/features/paywall/presentation/pages/paywall_page.dart';
import 'package:hubx_example/features/profile/presentation/pages/profile_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  final String? initialRoute;

  AppRouter({this.initialRoute});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnboardingRoute.page,
          initial: initialRoute == OnboardingRoute.name,
        ),
        AutoRoute(
          page: DashboardRoute.page,
          initial: initialRoute == DashboardRoute.name,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: DiagnoseRoute.page),
            AutoRoute(page: MyGardenRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(
          page: PaywallRoute.page,
          initial: initialRoute == PaywallRoute.name,
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
