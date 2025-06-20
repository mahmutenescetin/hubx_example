import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/shared/widgets/reusable_text.dart';

class ReusableElevatedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool expanded;
  final double? borderRadius;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;
  final EdgeInsets? containerPadding;
  final Color? buttonTextColor;

  const ReusableElevatedButton({
    required this.text,
    required this.onPressed,
    this.borderRadius,
    this.expanded = true,
    this.boxDecoration,
    this.textStyle,
    this.containerPadding,
    this.buttonTextColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: containerPadding ??
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
        decoration: boxDecoration ??
            BoxDecoration(
              color: const Color.fromRGBO(40, 175, 110, 1),
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
          children: [
            Flexible(
              child: ReusableText(
                text,
                style: textStyle ??
                    context.textStyles.b16Regular600.copyWith(
                      color: context.colors.appColors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
