import '../../interfaces/interfaces.dart';
import '../builders/builders.dart' show WhereQueryBuilder;
import '../models.dart' show SqlFilter;

mixin Whereable on QueryBuilder {
  WhereQueryBuilder where(SqlFilter filter) => WhereQueryBuilder(this, filter);
}
