import 'package:flutter/material.dart';
import 'package:hubx_example/core/theme/app_colors.dart';
import 'package:hubx_example/core/theme/app_text_styles.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final AppTextStyles textStyles;
  final AppColors colors;

  AppThemeExtension({
    required this.textStyles,
    required this.colors,
  });

  @override
  AppThemeExtension copyWith({AppTextStyles? textStyles, AppColors? colors}) {
    return AppThemeExtension(
      textStyles: textStyles ?? this.textStyles,
      colors: colors ?? this.colors,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    return this;
  }
}
