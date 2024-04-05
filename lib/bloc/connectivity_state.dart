part of 'connectivity_bloc.dart';

class InternetState {}

class InitState extends InternetState {}

class ConnectedState extends InternetState {
  String message;
  ConnectedState(this.message);
}

class DisconnectedState extends InternetState {
  String message;
  DisconnectedState(this.message);
}
