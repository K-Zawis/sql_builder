import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart';

import 'update_builder.module.dart';

class UpsertQueryBuilder extends UpdateQueryBuilder {
  final QueryBuilder previous;
  final List<String> conflictColumns;
  UpsertQueryBuilder(this.previous, super.table, super.row, {required this.conflictColumns});

  @override
  String build([bool finalBuild = true]) {
    final String updateSetClause =
        row.keys.where((col) => !conflictColumns.contains(col))
        .map((col) => "$col=excluded.$col")
        .join(", ");

    return "${previous.build(false)} ON CONFLICT (${conflictColumns.join(", ")}) DO UPDATE SET $updateSetClause".withSemicolon(finalBuild);
  }
}
