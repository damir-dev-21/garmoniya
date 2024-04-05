abstract class AuthRepository {
  Map<String, dynamic> checkAuth();
  Future<Map<String, dynamic>> sync();
  Future<Map<String, dynamic>> login({required Map<String, dynamic> data});
  Future<void> logout({required Map<String, dynamic> data});
}
