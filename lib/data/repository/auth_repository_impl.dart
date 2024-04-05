import '../../domain/repository/auth_repository.dart';
import '../local/remote/auth_remote.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._authRemote);

  final AuthRemote _authRemote;

  @override
  Map<String, dynamic> checkAuth() {
    return _authRemote.checkAuth();
  }

  @override
  Future<Map<String, dynamic>> sync() {
    return _authRemote.sync();
  }

  @override
  Future<Map<String, dynamic>> login(
      {required Map<String, dynamic> data}) async {
    return _authRemote.login(data);
  }

  @override
  Future<void> logout({required Map<String, dynamic> data}) async {
    await _authRemote.logout(data);
  }
}
