import '../../interfaces/interfaces.dart';
import '../builders/builders.dart' show OffsetableOrderByQueryBuilder, OrderByQueryBuilder;
import '../models.dart' show OrderBy;

mixin Orderable on QueryBuilder {
  OrderByQueryBuilder orderBy(OrderBy order) => OrderByQueryBuilder(this, order);
}

mixin OrderableWithOffset on QueryBuilder {
  OffsetableOrderByQueryBuilder orderBy(OrderBy order) =>  OffsetableOrderByQueryBuilder(this, order);
}