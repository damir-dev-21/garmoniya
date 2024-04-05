abstract class CartRepository {
  Future<Map<String, dynamic>> getCart();
  Future<Map<String, dynamic>> sendCart(Map<String, dynamic> data);
  Future<Map<String, dynamic>> sendOrder(Map<String, dynamic> data);
}
