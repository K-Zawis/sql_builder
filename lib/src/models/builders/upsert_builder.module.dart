import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart';

class UpsertQueryBuilder extends QueryBuilder {
  final String table;
  final Map<String, dynamic> row;
  late final List<String> _columns;
  late final List<dynamic> _values;

  UpsertQueryBuilder(this.table, this.row) {
    if (row.isEmpty) {
      throw ArgumentError.value(row, "rows", "Must not be empty");
    }
    _columns = row.keys.toList();
    _values = row.values.toList();
  }

  @override
  String build([bool finalBuild = true]) {
    return "INSERT OR REPLACE INTO ${this.table} (${_columns.join(", ")}) VALUES ${formatValue(_values)}"
        .withSemicolon(finalBuild);
  }
}
