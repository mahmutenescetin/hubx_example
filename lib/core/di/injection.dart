import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hubx_example/core/network/dio_client.dart';
import 'package:hubx_example/core/router/app_router.dart';
import 'package:hubx_example/core/services/user_service.dart';
import 'package:hubx_example/features/home/data/datasources/home_remote_data_source.dart';
import 'package:hubx_example/features/home/data/repositories/home_repository_impl.dart';
import 'package:hubx_example/features/home/domain/repositories/home_repository.dart';
import 'package:hubx_example/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hubx_example/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:hubx_example/features/home/presentation/bloc/home_cubit.dart';
import 'package:hubx_example/features/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'package:hubx_example/features/paywall/presentation/bloc/patwall_cubit.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(dio: getIt()));

  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);

  getIt.registerLazySingleton<UserService>(() => UserService(getIt()));

  getIt.registerLazySingleton<AppRouter>(() => AppRouter(
        initialRoute: getIt<UserService>().getInitialRoute(),
      ));

  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(dioClient: getIt()),
  );

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: getIt()),
  );

  getIt.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(repository: getIt()),
  );
  getIt.registerLazySingleton<GetQuestionsUseCase>(
    () => GetQuestionsUseCase(repository: getIt()),
  );

  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      getCategoriesUseCase: getIt(),
      getQuestionsUseCase: getIt(),
    ),
  );
  getIt.registerLazySingleton<OnboardingCubit>(
    () => OnboardingCubit(),
  );
  getIt.registerLazySingleton<PaywallCubit>(
    () => PaywallCubit(),
  );
}
