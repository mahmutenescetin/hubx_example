import 'package:flutter/material.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/gen/assets.gen.dart';
import 'package:hubx_example/shared/widgets/gradient_text.dart';

class PremiumBanner extends StatelessWidget {
  final VoidCallback? onTap;

  const PremiumBanner({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2B2417),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(Assets.png.messageIcon.path),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GradientText(
                        context.l10n.premium,
                        style: context.textStyles.b16Regular700,
                        gradient: const LinearGradient(colors: [
                          Color.fromRGBO(229, 201, 144, 1),
                          Color.fromRGBO(228, 176, 70, 1)
                        ]),
                      ),
                      const SizedBox(height: 2),
                      GradientText(
                        context.l10n.upgrade,
                        style: context.textStyles.b13Regular400,
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(245, 194, 91, 1),
                            Color.fromRGBO(255, 222, 156, 1),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFFF5D97A),
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
