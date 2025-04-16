import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart' show StringExtensions;
import '../mixins/mixins.dart' show DeleteWhereable, Limitable, Orderable;

/* 

  DELETE FROM ...
  WHERE ...
  ORDER BY ...
  LIMIT ...

 */

class DeleteQueryBuilder extends QueryBuilder with DeleteWhereable, Orderable, Limitable {
  final String table;

  DeleteQueryBuilder(this.table);
  
  @override
  String build([bool finalBuild = true]) {
    return "DELETE FROM $table".withSemicolon(finalBuild);
  }

}