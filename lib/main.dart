import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hubx_example/core/di/injection.dart';
import 'package:hubx_example/core/router/app_router.dart';
import 'package:hubx_example/core/theme/app_colors.dart';
import 'package:hubx_example/core/theme/app_text_styles.dart';
import 'package:hubx_example/core/theme/assets.g.dart';
import 'package:hubx_example/core/utils/extensions/theme_extensions.dart';
import 'package:hubx_example/l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final appRouter = AppRouter();

  runApp(
    buildAppProviders(
      MyApp(appRouter: appRouter),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Hubx Example',
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(),
          supportedLocales: const [
            Locale('en'),
            Locale('tr'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: const Locale('en'),
          theme: ThemeData.light().copyWith(
            extensions: [
              AppThemeExtension(
                textStyles: AppTextStyles(),
                colors: AppColors(),
                assets: const Assets.light(),
              ),
            ],
          ),
          darkTheme: ThemeData.dark().copyWith(
            extensions: [
              AppThemeExtension(
                textStyles: AppTextStyles(),
                colors: AppColors(),
                assets: const Assets.dark(),
              ),
            ],
          ),
        );
      },
    );
  }
}
