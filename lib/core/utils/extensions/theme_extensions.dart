import 'package:flutter/material.dart';
import 'package:hubx_example/core/theme/app_colors.dart';
import 'package:hubx_example/core/theme/app_text_styles.dart';
import 'package:hubx_example/core/theme/assets.g.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final AppTextStyles textStyles;
  final AppColors colors;
  final Assets assets;

  AppThemeExtension({
    required this.textStyles,
    required this.colors,
    required this.assets,
  });

  @override
  AppThemeExtension copyWith({
    AppTextStyles? textStyles, 
    AppColors? colors, 
    Assets? assets,
  }) {
    return AppThemeExtension(
      textStyles: textStyles ?? this.textStyles,
      colors: colors ?? this.colors,
      assets: assets ?? this.assets,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    return this;
  }
}
