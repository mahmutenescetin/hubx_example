// ignore_for_file: cascade_invocations

import 'string_templates.dart';
import 'utils.dart';

void main(List<String> args) {
  const themes = <String>['light', 'dark'];
  const themePath = 'lib/core/theme/';
  const assetsPath = 'assets';
  const folders = <String>['png', 'svg', 'images', 'icons', 'lottie'];

  /// Generates [app_assets.g.dart] file with all the assets.
  generateAppAssetsFile(
    assetsPath: assetsPath,
    folders: folders,
  );

  /// Generates [assets.g.dart] file with all the assets that have theme
  /// support.
  generateAssetsFile(
    themePath: themePath,
    assetsPath: assetsPath,
    folders: folders,
    themes: themes,
  );
}

void generateAppAssetsFile({
  required String assetsPath,
  required List<String> folders,
}) {
  final assetFileContent = StringBuffer();

  assetFileContent.writeln(StringTemplates.header);
  assetFileContent.writeln('''
part of 'package:hubx_example/core/theme/assets.g.dart';
''');

  assetFileContent.writeln('mixin _AppAssets {');
  assetFileContent.writeln('  // Base Asset Paths');

  for (final folder in folders) {
    final assets = getAssets('$assetsPath/$folder/');

    assetFileContent.writeln(
      '''  ${assets.isEmpty ? '// ' : ''}static const String _base${folder.pluralToSingular().toFirstUpperCase()}Path = 'assets/$folder';''',
    );
  }

  for (final folder in folders) {
    assetFileContent.writeln();

    assetFileContent.writeln('  // ${folder.toUpperCase()}');

    final rawAssets = getAssets('$assetsPath/$folder/');

    if (rawAssets.isEmpty) {
      continue;
    }
    final assets = rawAssets.map((e) => e.path.split('/').last).toList()
      ..sortByLength();

    for (final asset in assets) {
      assetFileContent.write(
        '''
  static const String ${asset.split('.').first.snakeToCamelCase()} = '\$_base${folder.pluralToSingular().toFirstUpperCase()}Path/$asset';
''',
      );
    }
  }

  assetFileContent.writeln('}');

  writeFile(
    'lib/core/constants/app_assets.g.dart',
    assetFileContent.toString(),
  );
}

void generateAssetsFile({
  required String themePath,
  required String assetsPath,
  required List<String> folders,
  required List<String> themes,
}) {
  final assetFileContent = StringBuffer();

  assetFileContent.write(StringTemplates.header);
  assetFileContent.write(StringTemplates.ignores);
  assetFileContent.writeln(
    '''
import 'package:flutter/material.dart';

part '../constants/app_assets.g.dart';
''',
  );

  assetFileContent.writeln(
    'class Assets extends ThemeExtension<Assets> {',
  );
  final allAssets = <String>[];
  final distinctAssets = <String>[];

  for (final folder in folders) {
    allAssets.addAll(
      getAssets('$assetsPath/$folder/')
          .map((rawAsset) => rawAsset.path.split('/').last)
          .map((e) => e.split('.').first.snakeToCamelCase())
          .toList(),
    );
  }

  for (final folder in folders) {
    assetFileContent.writeln('  // ${folder.toUpperCase()}');

    final rawAssets = getAssets('$assetsPath/$folder/');
    final assets = rawAssets
        .map((rawAsset) => rawAsset.path.split('/').last)
        .map((asset) {
          for (final theme in themes) {
            final themeSplitPattern = '${theme}_';

            if (asset.startsWith(themeSplitPattern)) {
              return asset.replaceFirst(themeSplitPattern, '');
            }
          }

          return asset;
        })
        .map((e) => e.split('.').first.snakeToCamelCase())
        .toSet()
        .toList()
      ..sortByLength();

    for (final asset in assets) {
      assetFileContent.writeln('''  final String $asset;''');
    }

    assetFileContent.writeln();
    distinctAssets.addAll(assets);
  }

  distinctAssets.sortByLength();
  assetFileContent.writeln('  const Assets({');

  for (final asset in distinctAssets) {
    assetFileContent.writeln(
      '    required this.$asset,',
    );
  }

  assetFileContent.writeln('  });');
  assetFileContent.writeln();

  assetFileContent.writeln(
    '''
  @override
  Assets copyWith({''',
  );

  for (final asset in distinctAssets) {
    assetFileContent.writeln(
      '    String? $asset,',
    );
  }

  assetFileContent.writeln(
    '''
  }) {
    return Assets(''',
  );

  for (final asset in distinctAssets) {
    assetFileContent.writeln(
      '      $asset: $asset ?? this.$asset,',
    );
  }

  assetFileContent.writeln(
    '''
    );
  }''',
  );

  assetFileContent.writeln();

  assetFileContent.writeln(
    '''
  @override
  ThemeExtension<Assets> lerp(ThemeExtension<Assets>? other, double t) => this;''',
  );

  for (final theme in themes) {
    assetFileContent.writeln();
    assetFileContent.writeln('  const Assets.$theme({');

    for (final asset in distinctAssets) {
      final hasThemeSupport =
          allAssets.any((e) => e == '$theme${asset.toFirstUpperCase()}');

      assetFileContent.writeln(
        '''    this.$asset = _AppAssets.${hasThemeSupport ? '$theme${asset.toFirstUpperCase()}' : asset},''',
      );
    }

    assetFileContent.writeln('  });');
  }

  assetFileContent.writeln('}');

  writeFile('$themePath/assets.g.dart', assetFileContent.toString());
}
