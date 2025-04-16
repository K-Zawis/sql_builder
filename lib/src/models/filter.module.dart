import '../utils/utils.dart';

import 'enums/enums.dart' show Condition, LogicalOperator;

/// An SQL filter condition for constructing `WHERE` clauses in SQL queries.
///
/// The [SqlFilter] class helps build conditions for SQL queries, such as equality,
/// comparison, pattern matching, and logical combinations like `AND` and `OR`.
/// It supports a variety of operators, such as `=`, `>`, `<`, `BETWEEN`, `IN`, and `LIKE`.
///
/// ### Example Usage:
/// - **Equality condition**:
///   ```dart
///   SqlFilter("column1", isEqualTo: "value");
///   // Generates: column1 = 'value'
///   ```
/// - **Greater than condition**:
///   ```dart
///   SqlFilter("column2", isGreaterThan: 10);
///   // Generates: column2 > 10
///   ```
/// - **Logical combination (AND)**:
///   ```dart
///   SqlFilter.and([
///     SqlFilter("column1", isEqualTo: "value1"),
///     SqlFilter("column2", isGreaterThan: 10),
///   ]);
///   // Generates: (column1 = 'value1' AND column2 > 10)
///   ```
/// - **Logical combination (OR)**:
///   ```dart
///   SqlFilter.or([
///     SqlFilter("column1", isEqualTo: "value1"),
///     SqlFilter("column2", isGreaterThan: 10),
///   ]);
///   // Generates: (column1 = 'value1' OR column2 > 10)
///   ```
class SqlFilter {
  List<SqlFilter>? filters;
  LogicalOperator? _connector;

  String? col;

  Condition? where;
  dynamic isEqualTo;
  dynamic isNotEqualTo;
  dynamic isGreaterThan;
  dynamic isGreaterThanOrEqualTo;
  dynamic isLessThan;
  dynamic isLessThanOrEqualTo;
  String? isLike;
  String? isNotLike;
  List? isBetween;
  List? isNotBetween;
  List? whereIn;
  List? whereNotIn;

  late final Map<String, dynamic> _conditions;
  late final String? _operator;
  late final dynamic _value;

  /// Creates a SQL filter condition for a single column with a specified operator and value.
  ///
  /// This constructor allows users to define a condition for a column using various
  /// operators, such as equality, comparison, or pattern matching.
  ///
  /// Throws an [ArgumentError] if more than one condition or no valid condition is provided.
  SqlFilter(
    String this.col, {
    this.where,
    this.isEqualTo,
    this.isNotEqualTo,
    this.isGreaterThan,
    this.isGreaterThanOrEqualTo,
    this.isLessThan,
    this.isLessThanOrEqualTo,
    this.isBetween,
    this.isNotBetween,
    this.isLike,
    this.isNotLike,
    this.whereIn,
    this.whereNotIn,
  }) {
    _conditions = {
      "=": isEqualTo,
      "!=": isNotEqualTo,
      ">": isGreaterThan,
      ">=": isGreaterThanOrEqualTo,
      "<": isLessThan,
      "<=": isLessThanOrEqualTo,
      "BETWEEN": isBetween,
      "NOT BETWEEN": isNotBetween,
      "LIKE": isLike,
      "NOT LIKE": isNotLike,
      "IN": whereIn,
      "NOT IN": whereNotIn,
      if (where != null) where!.clause: where,
    };

    var validConditions = _conditions.entries.where((entry) => entry.value != null).toList();

    if (validConditions.length > 1) {
      throw ArgumentError('Only one condition can be specified per filter.');
    } else if (validConditions.isEmpty) {
      throw ArgumentError('A condition must be specified.');
    }

    var condition = validConditions.first;
    _operator = condition.key;
    _value = condition.value;
  }

  /// Combines multiple filters using the `OR` logical operator.
  ///
  /// The [filters] parameter is a list of [SqlFilter] objects that will be combined
  /// using the `OR` operator in the resulting SQL query.
  ///
  /// Throws an [ArgumentError] if the [filters] list is empty or contains fewer than 2 filters.
  SqlFilter.or(List<SqlFilter> this.filters)
      : assert(filters.isNotEmpty, 'At least one filter must be provided'),
        _connector = LogicalOperator.or {
    if (filters!.length < 2) {
      throw ArgumentError('At least two conditions must be provided for an OR combination. Use SqlFilter instead.');
    }
  }

  /// Combines multiple filters using the `AND` logical operator.
  ///
  /// The [filters] parameter is a list of [SqlFilter] objects that will be combined
  /// using the `AND` operator in the resulting SQL query.
  ///
  /// Throws an [ArgumentError] if the [filters] list is empty or contains fewer than 2 filters.
  SqlFilter.and(List<SqlFilter> this.filters)
      : assert(filters.isNotEmpty, 'At least one filter must be provided'),
        _connector = LogicalOperator.and {
    if (filters!.length < 2) {
      throw ArgumentError('At least two conditions must be provided for an AND combination. Use SqlFilter instead.');
    }
  }

  /// Returns the SQL string representation of the filter object.
  ///
  /// If nested filters are used, they are joined using the logical operator
  /// and enclosed in parentheses. If a single condition is defined, it is
  /// formatted as a standard SQL comparison expression.
  @override
  String toString() {
    String clause = "";

    if (filters != null) {
      clause += "(${filters!.join(" ${_connector!.name.toUpperCase()} ")}";
    } else {
      return clause += "$col $_operator ${formatValue(_value, _operator == "BETWEEN")}".trim();
    }
    return clause += ")";
  }
}
