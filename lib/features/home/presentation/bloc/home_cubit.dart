import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_example/core/network/api_result.dart';
import 'package:hubx_example/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hubx_example/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:hubx_example/features/home/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetQuestionsUseCase getQuestionsUseCase;

  HomeCubit({
    required this.getCategoriesUseCase,
    required this.getQuestionsUseCase,
  }) : super(HomeInitial());

  Future<void> loadData() async {
    emit(HomeLoading());

    try {
      final categoriesResult = await getCategoriesUseCase();
      final questionsResult = await getQuestionsUseCase();

      switch (categoriesResult) {
        case Success(data: final categories):
          switch (questionsResult) {
            case Success(data: final questions):
              emit(DataLoaded(
                categories: categories,
                questions: questions,
              ));
            case Failure(message: final message):
              emit(HomeError(message));
          }
        case Failure(message: final message):
          emit(HomeError(message));
      }
    } catch (e) {
      emit(HomeError('Unexpected error: $e'));
    }
  }

  Future<void> loadCategories() async {
    await loadData();
  }

  Future<void> loadQuestions() async {
    await loadData();
  }
}
