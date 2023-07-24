extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    String replaceSeparator = replaceAll('_', ' ');
    String lowerCaseInput = replaceSeparator.toLowerCase();
    return lowerCaseInput.substring(0, 1).toUpperCase() +
        lowerCaseInput.substring(1);
  }
}
