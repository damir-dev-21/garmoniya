import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? subscription;

  InternetBloc() : super(InitState()) {
    on<OnConnected>((event, emit) {
      emit(ConnectedState("online"));
    });
    on<OnDisconnected>((event, emit) {
      emit(DisconnectedState("offline"));
    });
    on<OnCheckConnection>((event, emit) {
      final result = Connectivity().checkConnectivity();
      if (result == ConnectivityResult.none) {
        add(OnDisconnected());
      } else {
        add(OnConnected());
      }
    });

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        add(OnDisconnected());
      } else {
        add(OnConnected());
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
