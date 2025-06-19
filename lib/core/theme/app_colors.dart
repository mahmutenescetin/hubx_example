import 'package:flutter/material.dart';

class AppGeneralTextColors {
  final Color primary = const Color.fromRGBO(19, 35, 27, 1);
  final Color secondary = const Color.fromRGBO(19, 35, 27, 0.7);
  final Color secondaryLight = const Color.fromRGBO(89, 113, 101, 0.7);
}

class AppTextColors {
  final AppGeneralTextColors generalText = AppGeneralTextColors();
}

class AppColors {
  final AppTextColors text = AppTextColors();
}
