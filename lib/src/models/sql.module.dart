import 'package:sql_builder/src/models/builders/upsert_builder.module.dart';

import 'builders/builders.dart';
import 'builders/insert_builder.module.dart';
import 'builders/update_builder.module.dart';

class Sql {
  static SelectQueryBuilder select(
    String table, [
    List<String> columns = const ['*'],
  ]) {
    return SelectQueryBuilder(table, columns);
  }

  static InsertQueryBuilder insert(
    String table,
    List<Map<String, dynamic>> rowMaps,
  ) {
    return InsertQueryBuilder(table, rowMaps);
  }

  static UpdateQueryBuilder update(String table, Map<String, dynamic> rowMap) {
    return UpdateQueryBuilder(table, rowMap);
  }

  static DeleteQueryBuilder delete(String table) {
    return DeleteQueryBuilder(table);
  }

  /// WARNING: this upsert implementation uses `INSERT OR REPLACE` not `ON CONFLICT`
  static UpsertQueryBuilder upsert(String table, Map<String, dynamic> row) {
    return UpsertQueryBuilder(table, row);
  }
}
