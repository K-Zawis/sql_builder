import '../../interfaces/interfaces.dart';
import '../builders/builders.dart' show DeleteWhereQueryBuilder, WhereQueryBuilder;
import '../models.dart' show SqlFilter;

mixin Whereable on QueryBuilder {
  WhereQueryBuilder where(SqlFilter filter) => WhereQueryBuilder(this, filter);
}

mixin DeleteWhereable on QueryBuilder {
  DeleteWhereQueryBuilder where(SqlFilter filter) => DeleteWhereQueryBuilder(this, filter);
}
