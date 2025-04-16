import '../models/enums/enums.dart' show Condition;

String formatValue(dynamic value, [bool between = false]) {
    if (between) return "${value[0]} AND ${value[1]}";

    if (value is String) {
      return "'$value'";
    } else if (value is List<List>) {
      return value.map((v) => formatValue(v)).join(', ');
    } else if (value is List) {
      return "(${value.map((v) => formatValue(v)).join(', ')})";
    } else if (value is Condition) {
      return "";
    } else {
      return value.toString();
    }
  }