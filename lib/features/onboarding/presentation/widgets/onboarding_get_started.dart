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
    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40.h),
            Spannable(
              context.l10n.welcomeToPlantApp,
              linkStyle: context.textStyles.b28SemiBold
                  .copyWith(fontWeight: FontWeight.w300),
              textStyle: context.textStyles.b28SemiBold,
            ),
            Gap(8.h),
            ReusableText(
              context.l10n.identifyPlantsDescription,
              style: context.textStyles.b16Regular.copyWith(
                color: context.colors.appColors.secondary,
              ),
            ),
            Gap(24.h),
            Center(
              child: SizedBox(
                width: 260.w,
                height: 320.h,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 35.w,
                      left: 180.w,
                      child: Image.asset(
                        Assets.png.sun.path,
                        width: 90.w,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        Assets.png.tree.path,
                        width: MediaQuery.of(context).size.width,
                        height: 500.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const ScanAnimationView(),
                    Positioned(
                      top: -20.w,
                      right: 160.w,
                      child: Image.asset(
                        Assets.png.spray.path,
                        width: 150.w,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
