class Utils {
  static String minToString(int? min) {
    if (min == null) return "_";
    return "${(min / 60).floor()} цаг ${min % 60} мин";
  }
}
