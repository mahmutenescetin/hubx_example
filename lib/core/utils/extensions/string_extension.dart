extension CapitalizeExtension on String {
  String capitalizeWords() {
    return split(' ').map((word) {
      if (word.isEmpty) {
        return '';
      }
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
