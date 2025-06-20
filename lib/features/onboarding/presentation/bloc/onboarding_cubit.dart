import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void goToPage(int pageIndex) => emit(pageIndex);

  void nextPage() => emit(state + 1);
}
