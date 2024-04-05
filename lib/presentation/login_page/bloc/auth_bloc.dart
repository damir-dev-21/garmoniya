import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/user.dart';
import '../../../data/repository/auth_repository_impl.dart';
import '../../../domain/classes/language_constants.dart';
import '../../../utils/shared_prefs.dart';
import '../../app.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositoryImpl authRepository;

  AuthBloc({required this.authRepository}) : super(const _Loading()) {
    on<AuthEvent>((events, emit) async {
      await events.map(
        checkAuth: (_) async => await _checkAuth(emit),
        login: (event) async => await _login(event, emit),
        logout: (event) async => await _logout(event, emit),
        logoutLocal: (event) async => await _logoutLocal(emit),
        sync: (_) async => await _sync(emit),
      );
    });
  }

  List<Map<String, dynamic>> _contacts = [];

  _sync(Emitter<AuthState> emit) async {
    final isAuth = await authRepository.sync();
    if (isAuth['status']) {
      _contacts.clear();
      isAuth['contacts'].forEach((e) => _contacts.add(e));
      List<Map<String, dynamic>> newList = [];
      newList = [..._contacts];
      emit(AuthState.authorized(isAuth["user"], newList));
    } else {
      emit(const AuthState.unauthorized("Вы не авторизованы"));
    }
  }

  _checkAuth(Emitter<AuthState> emit) {
    // emit(const AuthState.loading());
    final Map<String, dynamic> isAuth = authRepository.checkAuth();
    if (isAuth['status']) {
      emit(AuthState.authorized(isAuth["user"], []));
    } else {
      emit(const AuthState.unauthorized("Вы не авторизованы"));
    }
  }

  _login(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final result = await authRepository.login(data: event.data);
    if (result["status"]) {
      emit(AuthState.authorized(result['user'], []));
    } else {
      print(result['message']['ru']);
      emit(AuthState.unauthorized(result['message']['ru']));
    }
  }

  _logout(_Logout event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    await authRepository.logout(data: event.data);
    emit(const AuthState.unauthorized("Вы вышли из аккаунта"));
  }

  _logoutLocal(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    emit(const AuthState.unauthorized("Вы вышли из аккаунта"));
  }
}
