part of 'counter_bloc.dart';

class CounterState {
  int count;
  CounterState({required this.count});
}

class Intialstate extends CounterState {
  Intialstate() : super(count: 0);
}
