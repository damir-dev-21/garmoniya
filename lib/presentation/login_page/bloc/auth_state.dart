part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.unauthorized(String e) = _Unauthorized;
  const factory AuthState.authorized(
      User? user, List<Map<String, dynamic>> contacts) = _Authorized;
  const factory AuthState.error(String message) = _Error;
}
