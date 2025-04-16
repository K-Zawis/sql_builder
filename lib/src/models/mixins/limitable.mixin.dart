import '../../interfaces/interfaces.dart';
import '../builders/builders.dart' show LimitQueryBuilder, OffsetableLimitQueryBuilder;

mixin Limitable on QueryBuilder {
  LimitQueryBuilder limit(int limit) => LimitQueryBuilder(this, limit);
}

mixin LimitableWithOffset on QueryBuilder {
  OffsetableLimitQueryBuilder limit(int limit) => OffsetableLimitQueryBuilder(this, limit);
}
