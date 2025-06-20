import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubx_example/core/router/app_router.dart';
import 'package:hubx_example/features/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'package:hubx_example/features/onboarding/presentation/widgets/onboarding_care_guides.dart';
import 'package:hubx_example/features/onboarding/presentation/widgets/onboarding_get_started.dart';
import 'package:hubx_example/features/onboarding/presentation/widgets/onboarding_identify_plant.dart';
import 'package:hubx_example/shared/widgets/reusable_evaleted_button.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) =>
                    context.read<OnboardingCubit>().goToPage(index),
                children: const [
                  OnboardingGetStarted(),
                  OnboardingIdentifyPlant(),
                  OnboardingCareGuides(),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ReusableElevatedButton(
                onPressed: () {
                  if (state < 2) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    context.router.replace(const HomeRoute());
                  }
                },
                text: state > 1 ? 'Continue' : 'Get Started',
              ),
            ),
          );
        },
      ),
    );
  }
}
