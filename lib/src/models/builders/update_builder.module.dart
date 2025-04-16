import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart';
import '../mixins/mixins.dart' show SimpleWhereable;

/* 

  UPDATE ...
  SET column1 = value1, ...
  WHERE ...
  ORDER BY ...
  LIMIT ...

 */

class UpdateQueryBuilder extends QueryBuilder with SimpleWhereable {
  final String table;
  final Map<String, dynamic> row;

  UpdateQueryBuilder(this.table, this.row) {
    if (row.isEmpty) {
      throw ArgumentError.value(row, "rowMap", "Cannot be empty");
    }
  }

  @override
  String build([bool finalBuild = true]) {
    final String setValues = row.entries.map((entry) => "${entry.key} = ${formatValue(entry.value)}").join(", ");
    return "UPDATE $table SET $setValues".withSemicolon(finalBuild);
  }
}
