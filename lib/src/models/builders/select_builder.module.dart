import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart' show StringExtensions;
import '../mixins/mixins.dart' show Havingable, OrderableWithOffset, Whereable;

/* 

  SELECT ... FROM ...
  WHERE ...
  GROUP BY ...
  HAVING ...
  ORDER BY ...
  LIMIT ...
  OFFSET ...

 */

class SelectQueryBuilder extends QueryBuilder with Whereable, OrderableWithOffset, Havingable {
  final String table;
  final List<String> columns;

  SelectQueryBuilder(this.table, this.columns);

  @override
  String build([bool finalBuild = true]) {
    return "SELECT ${columns.join(", ")} FROM $table".withSemicolon(finalBuild);
  }
}
