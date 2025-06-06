import '../../interfaces/interfaces.dart';
import '../filter.module.dart';

class JoinQueryBuilder extends QueryBuilder {
  final QueryBuilder previous;
  final String table;
  final SqlFilter condition;
  final bool leftJoin;

  JoinQueryBuilder(this.previous, this.table, this.condition, this.leftJoin);

  @override
  String build([bool finalBuild = true]) {
    return "${previous.build(false)} ${leftJoin ? "LEFT" : "RIGHT"} JOIN $table ON $condition";
  }
}
