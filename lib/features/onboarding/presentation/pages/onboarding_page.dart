import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hubx_example/core/router/app_router.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/features/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'package:hubx_example/features/onboarding/presentation/widgets/onboarding_care_guides.dart';
import 'package:hubx_example/features/onboarding/presentation/widgets/onboarding_get_started.dart';
import 'package:hubx_example/features/onboarding/presentation/widgets/onboarding_identify_plant.dart';
import 'package:hubx_example/shared/widgets/reusable_evaleted_button.dart';
import 'package:hubx_example/shared/widgets/spannable.dart';

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
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    context.colors.appColors.onboardingBackground,
                    context.colors.appColors.onboardingBackgroundLight,
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
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
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ReusableElevatedButton(
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
                    text: state < 1
                        ? context.l10n.getStarted
                        : context.l10n.continueText,
                  ),
                  Gap(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Spannable(
                      align: TextAlign.center,
                      context.l10n.termsAndPrivacy,
                      textStyle: context.textStyles.b11Regular400.copyWith(
                        color: context.colors.appColors.secondaryLight,
                      ),
                      linkStyle: context.textStyles.b11Regular400.copyWith(
                        color: context.colors.appColors.secondaryLight,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Gap(20.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
