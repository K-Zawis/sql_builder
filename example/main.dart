import '../lib/src/models/models.dart';

/*
  Example Database Schema for Demonstration

  Table: users
  ┌────────────┬────────────┬──────────────┐
  │ id (INT)   │ name (TEXT)│ age (INT)    │
  ├────────────┼────────────┼──────────────┤
  │ 1          │ "Alice"    │ 30           │
  │ 2          │ "Bob"      │ 25           │
  │ 3          │ "Charlie"  │ 35           │
  └────────────┴────────────┴──────────────┘

  Table: posts
  ┌────────────┬───────────────┬──────────────────────┐
  │ id (INT)   │ user_id (INT) │ content (TEXT)       │
  ├────────────┼───────────────┼──────────────────────┤
  │ 1          │ 1             │ "Hello world!"       │
  │ 2          │ 1             │ "Dart is fun"        │
  │ 3          │ 2             │ "Flutter is awesome" │
  └────────────┴───────────────┴──────────────────────┘

  Relationships:
  - users.id <--> posts.user_id
  - One user can have many posts
*/

void main() {
  // inserting one row
  final Map<String, dynamic> row = {"name": "Gabriel", "age": 22};
  final InsertQueryBuilder insert = Sql.insert("users", [row]);
  print("\n --- Inserting 1 row ---");
  print(insert.build());

  // inserting multiple rows
  final List<Map<String, dynamic>> rows = [
    {"user_id": 4, "content": "This row has been inserted"},
    {"user_id": 4, "content": "This one too"},
  ];
  final InsertQueryBuilder insertMultiple = Sql.insert("posts", rows);
  print("\n --- Inserting multiple rows ---");
  print(insertMultiple.build());

  // simple select
  final SelectQueryBuilder simpleSelect = Sql.select("users", ["name", "age"]);
  print("\n --- Selecting named columns ---");
  print(simpleSelect.build());

  // select specific rows
  final filteredSelect = Sql.select("posts")
    .where(SqlFilter("user_id", isEqualTo: 4));
  print("\n --- Selecting all columns for user_id 4 ---");
  print(filteredSelect.build());

  // select with WHERE, ORDER BY, LIMIT, OFFSET
  final filteredOrderedSelect = Sql.select("posts")
    .where(SqlFilter("user_id", isEqualTo: 1))
    .orderBy(OrderBy.DESC(["id"]))
    .limit(2)
    .offset(0);
  print("\n --- Selecting latest 2 posts by user_id 1 ---");
  print(filteredOrderedSelect.build());

  // update example with WHERE clause
  final updateRow = {"age": 31};
  final update = Sql.update("users", updateRow)
    .where(SqlFilter("name", isEqualTo: "Alice"));
  print("\n --- Updating age of Alice to 31 ---");
  print(update.build());

  // delete with WHERE clause
  final delete = Sql.delete("posts")
    .where(SqlFilter("content", isEqualTo: "This row has been inserted"));
  print("\n --- Deleting post with specific content ---");
  print(delete.build());

  // delete with ORDER BY and LIMIT (PostgreSQL-specific)
  final limitedDelete = Sql.delete("posts")
    .orderBy(OrderBy.DESC(["id"]))
    .limit(1);
  print("\n --- Deleting latest post ---");
  print(limitedDelete.build());
}
