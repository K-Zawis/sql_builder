import 'enums/enums.dart' show Order;

class OrderBy {
  final List<String> columns;
  final Order order;

  OrderBy(this.columns, [this.order = Order.asc]);

  @override
  String toString() {
    return "${columns.join(", ")} ${order.toString()}";
  }
}