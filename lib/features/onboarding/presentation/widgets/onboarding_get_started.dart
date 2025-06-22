import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/gen/assets.gen.dart';
import 'package:hubx_example/shared/widgets/reusable_text.dart';
import 'package:hubx_example/shared/widgets/spannable.dart';

class OnboardingGetStarted extends StatelessWidget {
  const OnboardingGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(-1, -0.9),
            child: Spannable(
              context.l10n.welcomeToPlantApp,
              linkStyle: context.textStyles.b28SemiBold600,
              textStyle: context.textStyles.b28SemiBold300,
            ),
          ),
          Align(
            alignment: const Alignment(-1, -0.75),
            child: ReusableText(
              context.l10n.identifyPlantsDescription,
              style: context.textStyles.b16Regular400.copyWith(
                color: context.colors.appColors.secondary,
              ),
            ),
          ),
          Align(
            child: Image.asset(
              Assets.png.tree.path,
            ),
          ),
        ],
      ),
    );
  }
}
