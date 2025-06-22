import 'package:hubx_example/core/network/api_result.dart';
import 'package:hubx_example/features/home/domain/entities/question.dart';
import 'package:hubx_example/features/home/domain/repositories/home_repository.dart';

class GetQuestionsUseCase {
  final HomeRepository repository;

  GetQuestionsUseCase({required this.repository});

  Future<ApiResult<List<Question>>> call() async {
    final result = await repository.getQuestions();

    return result;
  }
}
