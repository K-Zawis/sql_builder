import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart' show StringExtensions;
import '../mixins/mixins.dart' show Havingable, Joinable, OrderableWithOffset, Whereable;

/* 

  SELECT ... FROM ...
  WHERE ...
  GROUP BY ...
  HAVING ...
  ORDER BY ...
  LIMIT ...
  OFFSET ...

 */

class SelectQueryBuilder extends QueryBuilder with Whereable, OrderableWithOffset, Havingable, Joinable {
  final String table;
  final List<String> columns;

  SelectQueryBuilder(this.table, [this.columns = const ["*"]]);

  @override
  String build([bool finalBuild = true]) {
    return "SELECT ${columns.join(", ")} FROM $table".withSemicolon(finalBuild);
  }
}
