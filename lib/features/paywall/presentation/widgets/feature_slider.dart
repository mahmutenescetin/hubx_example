import 'package:flutter/material.dart';
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
            title: 'Unlimited',
            subtitle: 'Plant Identify',
          ),
          FeatureCard(
            imagePath: Assets.png.fasterIcon.path,
            title: 'Faster',
            subtitle: 'Process',
          ),
          FeatureCard(
            imagePath: Assets.png.scannerIcon.path,
            title: 'Accurate',
            subtitle: 'Results',
          ),
        ],
      ),
    );
  }
}
