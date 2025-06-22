import 'package:hubx_example/core/network/api_result.dart';
import 'package:hubx_example/core/network/exceptions.dart';
import 'package:hubx_example/features/home/data/datasources/home_remote_data_source.dart';
import 'package:hubx_example/features/home/domain/entities/category.dart';
import 'package:hubx_example/features/home/domain/entities/question.dart';
import 'package:hubx_example/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<List<Category>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Success(categories);
    } on AppException catch (e) {
      return Failure(e.message);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<ApiResult<List<Question>>> getQuestions() async {
    try {
      final questions = await remoteDataSource.getQuestions();

      return Success(questions);
    } on AppException catch (e) {
      return Failure(e.message);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
