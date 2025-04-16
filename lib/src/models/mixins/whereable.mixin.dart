import '../../interfaces/interfaces.dart';
import '../builders/builders.dart' show SimpleWhereQueryBuilder, WhereQueryBuilder;
import '../models.dart' show SqlFilter;

mixin Whereable on QueryBuilder {
  WhereQueryBuilder where(SqlFilter filter) => WhereQueryBuilder(this, filter);
}

mixin SimpleWhereable on QueryBuilder {
  SimpleWhereQueryBuilder where(SqlFilter filter) => SimpleWhereQueryBuilder(this, filter);
}
