import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/core/utils/extensions/object_extensions.dart';
import 'package:hubx_example/shared/widgets/spannable.dart';

class SubscriptionOptionCard extends StatelessWidget {
  final bool selected;
  final String title;
  final String subtitle;
  final String? badgeText;
  final VoidCallback? onTap;

  const SubscriptionOptionCard({
    required this.selected,
    required this.title,
    required this.subtitle,
    super.key,
    this.badgeText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = selected
        ? const Color(0xFF28AF6E)
        : Colors.white.withValues(alpha: 0.15);
    final bgColor = selected
        ? const Color(0xFF173C2B)
        : Colors.white.withValues(alpha: 0.05);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 14, bottom: 14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            if (badgeText.isNotNull)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: context.colors.appColors.buttonColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14.r),
                      bottomLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    badgeText!,
                    style: context.textStyles.b12Regular500.copyWith(
                      color: context.colors.appColors.white,
                    ),
                  ),
                ),
              ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10.h),
                    Container(
                      width: 28,
                      height: 28,
                      padding: EdgeInsets.all(7.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selected
                              ? context.colors.appColors.buttonColor
                              : context.colors.appColors.white
                                  .withValues(alpha: 0.3),
                          width: 2,
                        ),
                        color: selected
                            ? context.colors.appColors.buttonColor
                            : Colors.transparent,
                      ),
                      child: selected
                          ? Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selected
                                    ? context.colors.appColors.white
                                    : Colors.transparent,
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10.h),
                    Text(
                      title,
                      style: context.textStyles.b16Regular500.copyWith(
                        color: context.colors.appColors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Spannable(
                      subtitle,
                      textStyle: context.textStyles.b12Regular300.copyWith(
                        color: context.colors.appColors.white
                            .withValues(alpha: 0.7),
                      ),
                      linkStyle: context.textStyles.b12Regular400.copyWith(
                        color: context.colors.appColors.white
                            .withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
