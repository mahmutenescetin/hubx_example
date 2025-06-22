import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';

class FeatureCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const FeatureCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.24),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                imagePath,
                height: 18.h,
                width: 18.w,
              ),
            ),
            Gap(10.h),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.b20Regular500.copyWith(
                color: context.colors.appColors.white,
              ),
            ),
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.b14Regular400.copyWith(
                color: context.colors.appColors.white.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
