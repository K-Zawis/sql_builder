import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart' show StringExtensions;
import '../mixins/mixins.dart' show Offsetable;

class LimitQueryBuilder extends QueryBuilder {
  final QueryBuilder previous;
  final int limit;

  LimitQueryBuilder(this.previous, this.limit);

  @override
  String build([bool finalBuild = true]) {
    return "${previous.build(false)} LIMIT $limit".withSemicolon(finalBuild);
  }
}

class OffsetableLimitQueryBuilder extends LimitQueryBuilder with Offsetable {
  OffsetableLimitQueryBuilder(super.previous, super.limit);
}
