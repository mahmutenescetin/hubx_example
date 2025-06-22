import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/gen/assets.gen.dart';
import 'package:hubx_example/shared/widgets/spannable.dart';

class OnboardingCareGuides extends StatelessWidget {
  const OnboardingCareGuides({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
          child: Spannable(
            context.l10n.getPlantCareGuides,
            textStyle: context.textStyles.b28SemiBold500,
            linkStyle: context.textStyles.b28SemiBold800,
          ),
        ),
        Align(
          alignment: const Alignment(0.5, -0.9),
          child: Image.asset(
            width: 150.w,
            Assets.png.line.path,
            fit: BoxFit.contain,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            Assets.png.onboardingCareGuides.path,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
