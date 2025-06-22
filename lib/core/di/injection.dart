import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'package:hubx_example/features/home/data/datasources/home_remote_data_source.dart';
import 'package:hubx_example/features/home/data/repositories/home_repository_impl.dart';
import 'package:hubx_example/features/home/domain/repositories/home_repository.dart';
import 'package:hubx_example/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hubx_example/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:hubx_example/features/home/presentation/bloc/home_cubit.dart';
import 'package:hubx_example/core/network/dio_client.dart';
import 'package:hubx_example/core/router/app_router.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => DioClient(dio: getIt()));

  getIt.registerSingleton<AppRouter>(AppRouter());

  getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(dioClient: getIt()));

  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: getIt()));

  getIt.registerLazySingleton(() => GetCategoriesUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => GetQuestionsUseCase(repository: getIt()));

  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(
      getCategoriesUseCase: getIt<GetCategoriesUseCase>(),
      getQuestionsUseCase: getIt<GetQuestionsUseCase>(),
    ),
  );
}
