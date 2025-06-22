import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_example/features/paywall/domain/enums/paywall_plan.dart';


part 'paywall_state.dart';

class PaywallCubit extends Cubit<PaywallState> {
  PaywallCubit() : super(const PaywallState(selectedPlan: PaywallPlan.yearly));

  void selectPlan(PaywallPlan plan) {
    emit(state.copyWith(selectedPlan: plan));
  }
}
