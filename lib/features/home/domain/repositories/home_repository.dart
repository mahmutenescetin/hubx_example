import 'package:hubx_example/core/network/api_result.dart';
import 'package:hubx_example/features/home/domain/entities/category.dart';
import 'package:hubx_example/features/home/domain/entities/question.dart';

abstract class HomeRepository {
  Future<ApiResult<List<Category>>> getCategories();

  Future<ApiResult<List<Question>>> getQuestions();
}
