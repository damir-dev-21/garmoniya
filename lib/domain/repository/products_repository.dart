abstract class ProductRepository {
  Future<Map<String, dynamic>> getProducts();
  Future<Map<String, dynamic>> getProductsOffset(limit);
  Future<Map<String, dynamic>> getProductsSearch(limit, text);
  Future<Map<String, dynamic>> getRefuseListProductsSearch(limit, text);
  Future<Map<String, dynamic>> sendRefuseList(Map<String, dynamic> data);
  Future<Map<String, dynamic>> getRefusal();
  Future<Map<String, dynamic>> getFilterProducts(Map<String, dynamic> data);
  Future<Map<String, dynamic>> getFilterProductsOffset(limit, data);
  Future<Map<String, dynamic>> getFilterProductsSearch(limit, text, data);
}
