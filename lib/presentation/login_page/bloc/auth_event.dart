part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = _CheckAuth;
  const factory AuthEvent.sync() = _Sync;
  const factory AuthEvent.login({required Map<String, dynamic> data}) = _Login;
  const factory AuthEvent.logout({required Map<String, dynamic> data}) =
      _Logout;
  const factory AuthEvent.logoutLocal() = _LogoutLocal;
}
