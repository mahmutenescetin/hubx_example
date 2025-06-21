part of 'patwall_cubit.dart';



class PaywallState extends Equatable {
  final PaywallPlan selectedPlan;

  const PaywallState({required this.selectedPlan});

  PaywallState copyWith({PaywallPlan? selectedPlan}) {
    return PaywallState(
      selectedPlan: selectedPlan ?? this.selectedPlan,
    );
  }

  @override
  List<Object?> get props => [selectedPlan];
}
