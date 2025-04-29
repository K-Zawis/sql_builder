import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart';

import 'update_builder.module.dart';

// class UpsertQueryBuilder extends UpdateQueryBuilder {
//   final QueryBuilder previous;
//   final List<String> conflictColumns;
//   UpsertQueryBuilder(this.previous, super.table, super.row, {required this.conflictColumns});

//   @override
//   String build([bool finalBuild = true]) {
//     final String updateSetClause =
//         row.keys.where((col) => !conflictColumns.contains(col))
//         .map((col) => "$col=excluded.$col")
//         .join(", ");

//     return "${previous.build(false)} ON CONFLICT (${conflictColumns.join(", ")}) DO UPDATE SET $updateSetClause".withSemicolon(finalBuild);
//   }
// }

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
