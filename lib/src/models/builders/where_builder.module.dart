import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart' show StringExtensions;
import '../mixins/mixins.dart' show Groupable, Limitable, LimitableWithOffset, Offsetable, Orderable, OrderableWithOffset;
import '../models.dart';

class WhereQueryBuilder extends QueryBuilder with Groupable, OrderableWithOffset, LimitableWithOffset, Offsetable {
  final QueryBuilder previous;
  final SqlFilter filter;

  WhereQueryBuilder(this.previous, this.filter);

  @override
  String build([bool finalBuild = true]) {
    return "${previous.build(false)} WHERE ${filter.toString()}".withSemicolon(finalBuild);
  }
}

class SimpleWhereQueryBuilder extends QueryBuilder with Orderable, Limitable {
  final QueryBuilder previous;
  final SqlFilter filter;

  SimpleWhereQueryBuilder(this.previous, this.filter);

  @override
  String build([bool finalBuild = true]) {
    return "${previous.build(false)} WHERE ${filter.toString()}".withSemicolon(finalBuild);
  }
}
