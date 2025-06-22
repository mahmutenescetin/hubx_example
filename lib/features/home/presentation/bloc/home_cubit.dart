import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_example/core/network/api_result.dart';
import 'package:hubx_example/features/home/domain/entities/category.dart';
import 'package:hubx_example/features/home/domain/entities/question.dart';
import 'package:hubx_example/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:hubx_example/features/home/domain/usecases/get_questions_usecase.dart';
import 'package:hubx_example/features/home/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetQuestionsUseCase getQuestionsUseCase;

  List<Category> _allCategories = [];
  List<Question> _allQuestions = [];
  String _searchQuery = '';

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
              _allCategories = categories;
              _allQuestions = questions;
              _applySearch();
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

  void search(String query) {
    _searchQuery = query.toLowerCase().trim();
    _applySearch();
  }

  void _applySearch() {
    if (_searchQuery.isEmpty) {
      emit(DataLoaded(
        categories: _allCategories,
        questions: _allQuestions,
      ));
    } else {
      final filteredCategories = _allCategories.where((category) {
        return category.name.toLowerCase().contains(_searchQuery);
      }).toList();

      final filteredQuestions = _allQuestions.where((question) {
        return question.question.toLowerCase().contains(_searchQuery);
      }).toList();

      emit(DataLoaded(
        categories: filteredCategories,
        questions: filteredQuestions,
      ));
    }
  }

  Future<void> loadCategories() async {
    await loadData();
  }

  Future<void> loadQuestions() async {
    await loadData();
  }
}
