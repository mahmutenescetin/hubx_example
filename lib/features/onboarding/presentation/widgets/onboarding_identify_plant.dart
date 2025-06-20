import 'package:flutter/material.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/features/onboarding/presentation/widgets/scan_animation_view.dart';
import 'package:hubx_example/gen/assets.gen.dart';
import 'package:hubx_example/shared/widgets/spannable.dart';

class OnboardingIdentifyPlant extends StatelessWidget {
  const OnboardingIdentifyPlant({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Stack(
        children: [
          Spannable(
            context.l10n.takePhoneIdentify,
            textStyle: context.textStyles.b28SemiBold500,
            linkStyle: context.textStyles.b28SemiBold800,
          ),
          Positioned(
            top: 30,
            left: context.width / 2,
            child: Container(
              transformAlignment: Alignment.center,
              transform: Matrix4.rotationZ(
                0.1,
              ),
              child: Image.asset(
                Assets.png.line.path,
                width: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 35,
            child: Image.asset(
              Assets.png.tree.path,
              height: 400,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 50,
            child: Image.asset(
              Assets.png.phone.path,
            ),
          ),
          Positioned(
            top: context.height / 4,
            left: context.width / 5.1,
            child: const ScanAnimationView(),
          ),
        ],
      ),
    );
  }
}
