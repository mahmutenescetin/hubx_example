import 'dart:io';

List<File> getAssets(String path) {
  final directory = Directory(path);
  if (!directory.existsSync()) {
    return [];
  }
  
  return directory
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('.png') || 
                       file.path.endsWith('.jpg') || 
                       file.path.endsWith('.jpeg') || 
                       file.path.endsWith('.svg') || 
                       file.path.endsWith('.json'))
      .toList();
}

void writeFile(String path, String content) {
  final file = File(path);
  file.parent.createSync(recursive: true);
  file.writeAsStringSync(content);
}

extension StringExtensions on String {
  String toFirstUpperCase() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String snakeToCamelCase() {
    return split('_')
        .map((word) => word.isEmpty ? word : word.toFirstUpperCase())
        .join('');
  }

  String pluralToSingular() {
    if (endsWith('ies')) {
      return '${substring(0, length - 3)}y';
    }
    if (endsWith('s')) {
      return substring(0, length - 1);
    }
    return this;
  }
}

extension ListExtensions<T> on List<T> {
  void sortByLength() {
    sort((a, b) => a.toString().length.compareTo(b.toString().length));
  }
} 