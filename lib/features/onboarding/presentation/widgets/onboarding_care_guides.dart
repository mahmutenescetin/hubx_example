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
        Image.asset(
          Assets.png.onboardingBackground.path,
          width: context.width,
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
          child: Spannable(
            context.l10n.getPlantCareGuides,
            textStyle: context.textStyles.b28SemiBold500,
            linkStyle: context.textStyles.b28SemiBold800,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            Assets.png.phone2.path,
            fit: BoxFit.contain,
          ),
        ),
        Align(
          alignment: const Alignment(1.0, -0.4),
          child: Image.asset(
            Assets.png.bookmarkIcon.path,
            fit: BoxFit.contain,
            height: 200,
          ),
        ),
        Align(
          alignment: const Alignment(0.1, -0.5),
          child: Image.asset(
            Assets.png.spray.path,
            fit: BoxFit.contain,
            height: 200,
          ),
        ),
        Align(
          alignment: const Alignment(1.3, -0.25),
          child: Image.asset(
            Assets.png.sun.path,
            fit: BoxFit.contain,
            height: 200,
          ),
        ),
      ],
    );
  }
}
