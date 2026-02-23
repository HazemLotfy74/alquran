import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubit extends Cubit<bool> {
  final Connectivity _connectivity;
  StreamSubscription? _sub;

  ConnectivityCubit(this._connectivity) : super(true) {
    _sub = _connectivity.onConnectivityChanged.listen((result) {
      emit(!_isDisconnected(result as ConnectivityResult));
    });
  }

  bool _isDisconnected(ConnectivityResult r) =>
      r == ConnectivityResult.none;

  Future<void> checkNow() async {
    final r = await _connectivity.checkConnectivity();
    emit(!_isDisconnected(r as ConnectivityResult));
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}