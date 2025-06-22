import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'package:hubx_example/features/home/data/datasources/home_remote_data_source.dart';
import 'package:hubx_example/features/home/data/repositories/home_repository_impl.dart';
import 'package:hubx_example/features/home/domain/repositories/home_repository.dart';
import 'package:hubx_example/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hubx_example/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:hubx_example/features/home/presentation/bloc/home_cubit.dart';
import 'package:hubx_example/core/network/dio_client.dart';

Widget buildAppProviders(Widget child) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider<DioClient>(
        create: (_) => DioClient(dio: Dio()),
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
    ],
    child: BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        getCategoriesUseCase: context.read<GetCategoriesUseCase>(),
        getQuestionsUseCase: context.read<GetQuestionsUseCase>(),
      ),
      child: child,
    ),
  );
}
