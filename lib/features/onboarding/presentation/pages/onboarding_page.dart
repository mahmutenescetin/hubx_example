import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/shared/widgets/reusable_evaleted_button.dart';
import 'package:hubx_example/shared/widgets/reusable_text.dart';
import 'package:hubx_example/shared/widgets/spannable.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spannable('Welcome to %%PlantApp%%',
                  linkStyle: context.textStyles.b28SemiBold,
                  textStyle: context.textStyles.b28SemiBold),
              Gap(8.h),
              ReusableText(
                'Identify more than 3000+ plants and 88% accuracy.',
                style: context.textStyles.b16Regular.copyWith(
                  color: context.colors.text.generalText.secondary,
                ),
              ),
              Gap(40.h),
              Image.asset(context.assets.GetStarted),
              ReusableElevatedButton(
                text: 'Get Started',
                onPressed: () {},
              ),
              Gap(16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44.0.w),
                child: Spannable(
                  align: TextAlign.center,
                  'By tapping next, you are agreeing to '
                  'PlantID %%Terms of Use%% & %%Privacy Policy%%.',
                  textStyle: context.textStyles.b11Regular.copyWith(
                    color: context.colors.text.generalText.secondaryLight,
                  ),
                  linkStyle: context.textStyles.b11Regular.copyWith(
                    color: context.colors.text.generalText.secondaryLight,
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
