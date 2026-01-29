import 'package:flutter_bloc/flutter_bloc.dart';

class SibhaCubit extends Cubit<int> {
  SibhaCubit() : super(0);

  void increment() => {emit(state + 1)};

  void decrement() => {emit(state > 0 ? state - 1 : 0)};
  void reset() => {emit(0)};
}
