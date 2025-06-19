import 'package:flutter/material.dart';

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
}
