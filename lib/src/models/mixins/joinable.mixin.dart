import '../../interfaces/interfaces.dart';
import '../builders/builders.dart' show JoinQueryBuilder;
import '../filter.module.dart';

mixin Joinable on QueryBuilder {
  JoinQueryBuilder join(
    String table, {
    required SqlFilter condition,
    bool isLeftJoin = true,
  }) =>
      JoinQueryBuilder(this, table, condition, isLeftJoin);
}
