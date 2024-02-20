part of 'switch_bloc.dart';

@immutable
sealed class SwitchEvent {}

class Enableordisable extends SwitchEvent {
  bool value;
  Enableordisable({required this.value});
}
