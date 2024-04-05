part of 'connectivity_bloc.dart';

abstract class InternetEvent {}

class OnConnected extends InternetEvent {}

class OnDisconnected extends InternetEvent {}

class OnCheckConnection extends InternetEvent {}
