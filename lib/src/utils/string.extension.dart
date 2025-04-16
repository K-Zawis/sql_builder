extension StringExtensions on String {
  String trimLastChar() {
    return isNotEmpty ? substring(0, length - 1) : this;
  }

  String withSemicolon(bool condition) => condition ? "$this;" : this;
}
