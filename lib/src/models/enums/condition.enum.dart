/// Common SQL conditions used in `WHERE` clauses.
///
/// This enum provides a set of conditions for constructing SQL expressions
/// that check for specific logical conditions, such as null checks, boolean
/// expressions, or unknown states. These conditions are used when a column's
/// value needs to be evaluated for a specific state, rather than simply
/// comparing it with a value. Each condition corresponds to a specific SQL
/// clause that will be inserted into the final query string.
///
/// The [clause] field represents the string form of the SQL condition that
/// will be included in the SQL query.
///
/// Example usage:
/// ```dart
/// SqlFilter("column", where: Condition.isNull);
/// ```
///
/// This would result in the SQL condition:
/// ```sql
/// WHERE column IS NULL
/// ```
///
/// Available conditions:
/// - [isNull]: Represents the `IS NULL` SQL condition for checking if a column value is null.
/// - [isNotNull]: Represents the `IS NOT NULL` SQL condition for checking if a column value is not null.
/// - [isTrue]: Represents the `IS TRUE` SQL condition for checking if a column value is boolean true.
/// - [isFalse]: Represents the `IS FALSE` SQL condition for checking if a column value is boolean false.
/// - [isUnknown]: Represents the `IS UNKNOWN` SQL condition for handling indeterminate or unknown states.
enum Condition {
  isNull('IS NULL'),
  isNotNull('IS NOT NULL'),
  isTrue('IS TRUE'),
  isFalse('IS FALSE'),
  isUnknown('IS UNKNOWN');

  final String clause;
  const Condition(this.clause);
}
