import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/gen/assets.gen.dart';
import 'package:hubx_example/shared/widgets/spannable.dart';

class OnboardingIdentifyPlant extends StatelessWidget {
  const OnboardingIdentifyPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Stack(
        children: [
          SizedBox(
            width: context.width.w * 0.7.w,
            child: Align(
              alignment: const Alignment(-1, -0.9),
              child: Spannable(
                context.l10n.takePhoneIdentify,
                textStyle: context.textStyles.b28SemiBold500,
                linkStyle: context.textStyles.b28SemiBold800,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1, -0.8),
            child: Image.asset(
              width: 150.w,
              Assets.png.line.path,
              fit: BoxFit.contain,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  Assets.png.onboarding.path,
                  fit: BoxFit.fitHeight,
                  height: 650.h,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
