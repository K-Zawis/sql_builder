import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart' show StringExtensions;
import '../mixins/mixins.dart' show Limitable, Offsetable;
import '../models.dart' show OrderBy;

class OrderByQueryBuilder extends QueryBuilder with Limitable {
  final QueryBuilder previous;
  final List<OrderBy> orders;

  OrderByQueryBuilder(this.previous, this.orders);

  @override
  String build([bool finalBuild = true]) {
    return "${previous.build(false)} ORDER BY ${orders.join(", ")}".withSemicolon(finalBuild);
  }
}

class OffsetableOrderByQueryBuilder extends OrderByQueryBuilder with Offsetable {
  OffsetableOrderByQueryBuilder(super.previous, super.orders);
}
