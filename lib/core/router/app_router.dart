import 'package:auto_route/auto_route.dart';

import 'package:hubx_example/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:hubx_example/features/home/presentation/pages/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
      ];
}
