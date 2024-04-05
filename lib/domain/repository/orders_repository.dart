abstract class OrdersRepository {
  Future<Map<String, dynamic>> getOrders();
  Future<Map<String, dynamic>> getOrdersOffset(offset);
  Future<Map<String, dynamic>> getOrdersFilter(filter);
  Future<Map<String, dynamic>> getOrdersFilterOffset(
    offset,
    filter,
  );
  Future<Map<String, dynamic>> getOrder(uuidOrder);
}
