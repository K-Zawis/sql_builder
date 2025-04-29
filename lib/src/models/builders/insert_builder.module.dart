import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart';

// import 'upsert_builder.module.dart';

/* 

  INSERT INTO ... (..)
  VALUES (...)

 */

class InsertQueryBuilder extends QueryBuilder {
  final String table;
  final List<Map<String, dynamic>> rows;
  late final List<String> _columns;
  late final List<List<dynamic>> _values;

  InsertQueryBuilder(this.table, this.rows) {
    if (rows.isEmpty) {
      throw ArgumentError.value(rows, "rows", "Must not be empty");
    }
    _columns = rows.first.keys.toList();
    _values = rows.map((row) => row.values.toList()).toList();

    if (_columns.isEmpty) {
      throw ArgumentError.value(_columns, "rows", "Each row must have at least one column");
    }

    final expectedKeys = _columns.toSet();
    final hasMismatchedKeys = rows.any((map) {
      final keySet = map.keys.toSet();
      return keySet.difference(expectedKeys).isNotEmpty || expectedKeys.difference(keySet).isNotEmpty;
    });
    if (hasMismatchedKeys) {
      throw ArgumentError.value(rows, "rows", "All rows must have the same set of columns");
    }
  }

  @override
  String build([bool finalBuild = true]) {
    return "INSERT INTO $table (${_columns.join(", ")}) VALUES ${formatValue(_values)}".withSemicolon(finalBuild);
  }
}
