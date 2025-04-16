import '../../interfaces/interfaces.dart';
import '../builders/builders.dart' show OffsetQueryBuilder;

mixin Offsetable on QueryBuilder {
  OffsetQueryBuilder offset(int offset) => OffsetQueryBuilder(this, offset);
}
