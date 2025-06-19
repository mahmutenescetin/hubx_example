import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubx_example/core/router/app_router.dart';
import 'package:hubx_example/core/theme/app_colors.dart';
import 'package:hubx_example/core/theme/app_text_styles.dart';
import 'package:hubx_example/core/utils/extensions/theme_extensions.dart';

void main() {
  final appRouter = AppRouter();

  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        title: 'App Starter',
        theme: ThemeData.light().copyWith(
          extensions: [
            AppThemeExtension(
              textStyles: AppTextStyles(),
              colors: AppColors(),
            ),
          ],
        ),
        darkTheme: ThemeData.dark().copyWith(
          extensions: [
            AppThemeExtension(
              textStyles: AppTextStyles(),
              colors: AppColors(),
            ),
          ],
        ),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
