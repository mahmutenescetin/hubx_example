import 'package:flutter/material.dart';
import 'package:hubx_example/core/theme/app_colors.dart';
import 'package:hubx_example/core/theme/app_text_styles.dart';
import 'package:hubx_example/core/utils/extensions/theme_extensions.dart';
import 'package:hubx_example/core/theme/assets.g.dart';
import 'package:hubx_example/l10n/app_localizations.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TargetPlatform get _platform => Theme.of(this).platform;

  bool get isAndroid => _platform == TargetPlatform.android;

  bool get isIOS => _platform == TargetPlatform.iOS;
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => MediaQuery.sizeOf(this);

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  double get width => size.width;

  double get height => size.height;

  double get keyboardGap => viewInsets.bottom;

  bool get canPop => ModalRoute.of(this)?.canPop ?? false;

  AppTextStyles get textStyles =>
      theme.extension<AppThemeExtension>()!.textStyles;

  AppColors get colors => theme.extension<AppThemeExtension>()!.colors;

  Assets get assets => theme.extension<AppThemeExtension>()!.assets;

  AppLocalizations get l10n => AppLocalizations.of(this)!;

}
