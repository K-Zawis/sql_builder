import '../lib/src/models/models.dart';

/* 
SELECT ...
FROM ...
WHERE ...
GROUP BY ...
HAVING ...
ORDER BY ...
LIMIT ...
OFFSET ...

UPDATE table
SET column1 = value1
WHERE ...
ORDER BY ...
LIMIT ...

DELETE FROM table
WHERE ...
ORDER BY ...
LIMIT ...
 */

void main() {
  final order = OrderBy.all([
    OrderBy("column1", Order.desc),
    OrderBy.ASC(["column2", "column3"]),
    OrderBy("column4", Order.desc)
  ]);

  final select =
      Sql.select("table").where(SqlFilter("column1", isBetween: [1, 18])).orderBy(order).limit(20).offset(10);
  print(select.build());

  print("");

  final update = Sql.update("table", {"test1": "value1", "test2": 2})
      .where(
        SqlFilter.and([
          SqlFilter("test1", where: Condition.isNull),
          SqlFilter("test2", isEqualTo: 1),
        ]),
      )
      .orderBy(OrderBy("test1"))
      .limit(10);
  print(update.build());
}
