import 'package:flutter/material.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/features/paywall/presentation/widgets/feature_card.dart';
import 'package:hubx_example/gen/assets.gen.dart';

class FeatureSlider extends StatelessWidget {
  const FeatureSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135, // Kart yüksekliğinden biraz fazla
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FeatureCard(
            imagePath: Assets.png.scannerIcon.path,
            title: context.l10n.featureUnlimited,
            subtitle: context.l10n.plantIdentify,
          ),
          FeatureCard(
            imagePath: Assets.png.fasterIcon.path,
            title: context.l10n.faster,
            subtitle: context.l10n.process,
          ),
          FeatureCard(
            imagePath: Assets.png.scannerIcon.path,
            title: context.l10n.featureUnlimited,
            subtitle: context.l10n.plantIdentify,
          ),
        ],
      ),
    );
  }
}
