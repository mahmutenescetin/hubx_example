import 'package:flutter/material.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';

class OnboardingCareGuides extends StatelessWidget {
  const OnboardingCareGuides({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Get plant care guides',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Image.asset(
             context.assets.GetStarted,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
