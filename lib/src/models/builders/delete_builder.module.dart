import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart' show StringExtensions;
import '../mixins/mixins.dart' show SimpleWhereable, Limitable, Orderable;

/* 

  DELETE FROM ...
  WHERE ...
  ORDER BY ...
  LIMIT ...

 */

class DeleteQueryBuilder extends QueryBuilder with SimpleWhereable, Orderable, Limitable {
  final String table;

  DeleteQueryBuilder(this.table);
  
  @override
  String build([bool finalBuild = true]) {
    return "DELETE FROM $table".withSemicolon(finalBuild);
  }

}