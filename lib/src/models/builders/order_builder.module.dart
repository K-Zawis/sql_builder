import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart' show StringExtensions;
import '../mixins/mixins.dart' show Limitable, LimitableWithOffset, Offsetable;
import '../models.dart' show OrderBy;

class OrderByQueryBuilder extends QueryBuilder with Limitable {
  final QueryBuilder previous;
  final OrderBy order;

  OrderByQueryBuilder(this.previous, this.order);

  @override
  String build([bool finalBuild = true]) {
    return "${previous.build(false)} ORDER BY $order".withSemicolon(finalBuild);
  }
}

class OffsetableOrderByQueryBuilder extends QueryBuilder with LimitableWithOffset, Offsetable {
  final QueryBuilder previous;
  final OrderBy order;

  OffsetableOrderByQueryBuilder(this.previous, this.order);

  @override
  String build([bool finalBuild = true]) {
    return "${previous.build(false)} ORDER BY ${order}".withSemicolon(finalBuild);
  }
}
