import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart' show StringExtensions;
import '../mixins/mixins.dart';

/* 

  DELETE FROM ...
  WHERE ...
  ORDER BY ...
  LIMIT ...

 */

class DeleteQueryBuilder extends QueryBuilder with Whereable, Orderable, Limitable {
  final String table;

  DeleteQueryBuilder(this.table);
  
  @override
  String build([bool finalBuild = true]) {
    return "DELETE FROM $table".withSemicolon(finalBuild);
  }

}