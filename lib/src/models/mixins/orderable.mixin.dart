import '../../interfaces/interfaces.dart';
import '../builders/builders.dart' show OffsetableOrderByQueryBuilder, OrderByQueryBuilder;
import '../models.dart' show OrderBy;

mixin Orderable on QueryBuilder {
  OrderByQueryBuilder orderBy(List<OrderBy> orders) => OrderByQueryBuilder(this, orders);
}

mixin OrderableWithOffset on QueryBuilder {
  OffsetableOrderByQueryBuilder orderBy(List<OrderBy> orders) =>  OffsetableOrderByQueryBuilder(this, orders);
}