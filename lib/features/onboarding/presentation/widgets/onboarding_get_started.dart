import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/features/onboarding/presentation/widgets/scan_animation_view.dart';
import 'package:hubx_example/gen/assets.gen.dart';
import 'package:hubx_example/shared/widgets/reusable_text.dart';
import 'package:hubx_example/shared/widgets/spannable.dart';

class OnboardingGetStarted extends StatelessWidget {
  const OnboardingGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(40.h),
          Spannable(
            context.l10n.welcomeToPlantApp,
            linkStyle: context.textStyles.b28SemiBold600,
            textStyle: context.textStyles.b28SemiBold300,
          ),
          Gap(8.h),
          ReusableText(
            context.l10n.identifyPlantsDescription,
            style: context.textStyles.b16Regular400.copyWith(
              color: context.colors.appColors.secondary,
            ),
          ),
          Gap(24.h),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 310,
                left: 170,
                child: Image.asset(
                  Assets.png.blob.path,
                ),
              ),
              Positioned(
                top: 30,
                left: context.width / 5.5,
                child: const ScanAnimationView(),
              ),
              Align(
                alignment: const Alignment(0.8, -0.8),
                child: Image.asset(
                  Assets.png.sun.path,
                ),
              ),
              Image.asset(
                Assets.png.tree.path,
              ),
              Image.asset(
                Assets.png.spray.path,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
