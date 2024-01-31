import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(Intialstate()) {
    on<Increment>((event, emit) {
      final currentcount = state.count;
      final incrementcount = currentcount + 1;
      return emit(CounterState(count: incrementcount));
    });

    on<Decrement>((event, emit) {
      final currentcount = state.count;
      final decrementcount = currentcount - 1;
      return emit(CounterState(count: decrementcount));
    });
  }
}
