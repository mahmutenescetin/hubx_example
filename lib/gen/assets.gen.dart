/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/faster_icon.png
  AssetGenImage get fasterIcon =>
      const AssetGenImage('assets/png/faster_icon.png');

  /// File path: assets/png/healthcare_icon.png
  AssetGenImage get healthcareIcon =>
      const AssetGenImage('assets/png/healthcare_icon.png');

  /// File path: assets/png/home_background.png
  AssetGenImage get homeBackground =>
      const AssetGenImage('assets/png/home_background.png');

  /// File path: assets/png/home_icon.png
  AssetGenImage get homeIcon => const AssetGenImage('assets/png/home_icon.png');

  /// File path: assets/png/identify_icon.png
  AssetGenImage get identifyIcon =>
      const AssetGenImage('assets/png/identify_icon.png');

  /// File path: assets/png/leaf_icon.png
  AssetGenImage get leafIcon => const AssetGenImage('assets/png/leaf_icon.png');

  /// File path: assets/png/line.png
  AssetGenImage get line => const AssetGenImage('assets/png/line.png');

  /// File path: assets/png/message_icon.png
  AssetGenImage get messageIcon =>
      const AssetGenImage('assets/png/message_icon.png');

  /// File path: assets/png/onboarding.png
  AssetGenImage get onboarding =>
      const AssetGenImage('assets/png/onboarding.png');

  /// File path: assets/png/onboarding_care_guides.png
  AssetGenImage get onboardingCareGuides =>
      const AssetGenImage('assets/png/onboarding_care_guides.png');

  /// File path: assets/png/plant.png
  AssetGenImage get plant => const AssetGenImage('assets/png/plant.png');

  /// File path: assets/png/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/png/profile.png');

  /// File path: assets/png/scanner_icon.png
  AssetGenImage get scannerIcon =>
      const AssetGenImage('assets/png/scanner_icon.png');

  /// File path: assets/png/tree.png
  AssetGenImage get tree => const AssetGenImage('assets/png/tree.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        fasterIcon,
        healthcareIcon,
        homeBackground,
        homeIcon,
        identifyIcon,
        leafIcon,
        line,
        messageIcon,
        onboarding,
        onboardingCareGuides,
        plant,
        profile,
        scannerIcon,
        tree
      ];
}

class Assets {
  const Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
