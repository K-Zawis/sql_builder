import 'enums/enums.dart' show Order;

class OrderBy {
  List<OrderBy>? orders;

  List<String>? columns;

  String? column;
  Order? order;

  OrderBy(this.column, [this.order = Order.asc]);

  void _checkForDuplicates(List<String> columns, Set<String> seenColumns) {
    for (String col in columns) {
      if (seenColumns.contains(col)) {
        throw ArgumentError.value(columns, "columns", "Appears multiple times in ORDER BY clause.");
      }
      seenColumns.add(col);
    }
  }

  OrderBy.all(List<OrderBy> this.orders) {
    final Set<String> seenColumns = {};

    for (var orderBy in orders!) {
      // if object was initialised with [OrderBy.ASC] or [OrderBy.DESC]
      // else it was initialised as a plain [OrderBy] obj
      if (orderBy.columns != null) {
        _checkForDuplicates(orderBy.columns!, seenColumns);
      } else {
        if (seenColumns.contains(orderBy.column!)) {
          throw ArgumentError.value(orderBy.column, "column", "Appears multiple times in ORDER BY clause.");
        }
        seenColumns.add(orderBy.column!);
      }
    }
  }

  OrderBy.ASC(List<String> this.columns) : order = Order.asc {
    final Set<String> seenColumns = {};
    _checkForDuplicates(columns!, seenColumns);
  }
  OrderBy.DESC(List<String> this.columns) : order = Order.desc {
    final Set<String> seenColumns = {};
    _checkForDuplicates(columns!, seenColumns);
  }

  @override
  String toString() {
    String clause = "";

    if (orders != null) {
      clause += orders!.join(", ");
    } else if (columns != null) {
      clause += "${columns!.map((col) => "$col ${order!.toString()}").join(", ")}";
    } else {
      clause += "$column ${order!.toString()}";
    }

    return clause;
  }
}
