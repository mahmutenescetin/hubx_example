import 'package:hubx_example/core/network/api_result.dart';
import 'package:hubx_example/features/home/domain/entities/category.dart';
import 'package:hubx_example/features/home/domain/repositories/home_repository.dart';

class GetCategoriesUseCase {
  final HomeRepository repository;

  GetCategoriesUseCase({required this.repository});

  Future<ApiResult<List<Category>>> call() async {
    final result = await repository.getCategories();

    return result;
  }
}
