import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart' show StringExtensions;

class OffsetQueryBuilder extends QueryBuilder {
  final QueryBuilder previous;
  final int offset;

  OffsetQueryBuilder(this.previous, this.offset);

  @override
  String build([bool finalBuild = true]) {
    return "${previous.build(false)} OFFSET $offset".withSemicolon(finalBuild);
  }

}