import 'package:equatable/equatable.dart';
import 'package:hubx_example/features/home/domain/entities/category.dart';
import 'package:hubx_example/features/home/domain/entities/question.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class CategoriesLoaded extends HomeState {
  final List<Category> categories;

  const CategoriesLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class QuestionsLoaded extends HomeState {
  final List<Question> questions;

  const QuestionsLoaded(this.questions);

  @override
  List<Object?> get props => [questions];
}

class DataLoaded extends HomeState {
  final List<Category> categories;
  final List<Question> questions;

  const DataLoaded({
    required this.categories,
    required this.questions,
  });

  @override
  List<Object?> get props => [categories, questions];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
