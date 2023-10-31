import 'package:basketball_counter/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCounter extends Cubit<CounterState> {
  CubitCounter() : super(CounterInitState());

  int teamACount = 0;
  int teamBCount = 0;

  void incrementPoint({required int points, required String team}) {
    if (team == 'A') {
      teamACount += points;
      if (teamACount > 99) teamACount = 99;
      emit(CounterAIncrementState());
    } else {
      teamBCount += points;
      if (teamBCount > 99) teamBCount = 99;
      emit(CounterBIncrementState());
    }
  }

  void resetPoints() {
    teamACount = 0;
    teamBCount = 0;
    emit(CounterBIncrementState());
  }
}
