// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Assets Generator
// **************************************************************************

// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

import 'package:flutter/material.dart';

part '../constants/app_assets.g.dart';

class Assets extends ThemeExtension<Assets> {
  // PNG
  final String GetStarted;

  // SVG

  // IMAGES

  // ICONS

  // LOTTIE

  const Assets({
    required this.GetStarted,
  });

  @override
  Assets copyWith({
    String? GetStarted,
  }) {
    return Assets(
      GetStarted: GetStarted ?? this.GetStarted,
    );
  }

  @override
  ThemeExtension<Assets> lerp(ThemeExtension<Assets>? other, double t) => this;

  const Assets.light({
    this.GetStarted = _AppAssets.GetStarted,
  });

  const Assets.dark({
    this.GetStarted = _AppAssets.GetStarted,
  });
}
