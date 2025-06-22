import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubx_example/core/network/dio_client.dart';
import 'package:hubx_example/core/router/app_router.dart';
import 'package:hubx_example/core/theme/app_colors.dart';
import 'package:hubx_example/core/theme/app_text_styles.dart';
import 'package:hubx_example/core/utils/extensions/theme_extensions.dart';
import 'package:hubx_example/core/theme/assets.g.dart';
import 'package:hubx_example/features/home/data/datasources/home_remote_data_source.dart';
import 'package:hubx_example/features/home/data/repositories/home_repository_impl.dart';
import 'package:hubx_example/features/home/domain/repositories/home_repository.dart';
import 'package:hubx_example/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hubx_example/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:hubx_example/features/home/presentation/bloc/home_cubit.dart';
import 'package:hubx_example/l10n/app_localizations.dart';

void main() {
  final appRouter = AppRouter();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DioClient>(
          create: (context) => DioClient(dio: Dio()),
        ),
        RepositoryProvider<HomeRemoteDataSource>(
          create: (context) => HomeRemoteDataSourceImpl(
            dioClient: context.read<DioClient>(),
          ),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepositoryImpl(
            remoteDataSource: context.read<HomeRemoteDataSource>(),
          ),
        ),
        RepositoryProvider<GetCategoriesUseCase>(
          create: (context) => GetCategoriesUseCase(
            repository: context.read<HomeRepository>(),
          ),
        ),
        RepositoryProvider<GetQuestionsUseCase>(
          create: (context) => GetQuestionsUseCase(
            repository: context.read<HomeRepository>(),
          ),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(
            getCategoriesUseCase: context.read<GetCategoriesUseCase>(),
            getQuestionsUseCase: context.read<GetQuestionsUseCase>(),
          ),
        ),
      ],
      child: ScreenUtilInit(
        child: Builder(
          builder: (context) => MaterialApp.router(
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
            routerConfig: appRouter.config(),
            title: 'App Starter',
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
          ),
        ),
      ),
    );
  }
}
