import '../../interfaces/interfaces.dart';
import '../../utils/utils.dart' show StringExtensions;
import '../mixins/mixins.dart' show Groupable, Limitable, Offsetable, Orderable;
import '../models.dart';

class WhereQueryBuilder extends QueryBuilder with Orderable, Limitable, Offsetable, Groupable {
  final QueryBuilder previous;
  final SqlFilter filter;

  WhereQueryBuilder(this.previous, this.filter);

  @override
  String build([bool finalBuild = true]) {
    return "${previous.build(false)} WHERE ${filter.toString()}".withSemicolon(finalBuild);
  }
}
