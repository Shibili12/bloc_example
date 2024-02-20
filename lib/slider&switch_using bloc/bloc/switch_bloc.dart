import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial()) {
    on<Enableordisable>((event, emit) {
      if (event.value == true) {
        emit(SwitchState(isEnabled: true));
      } else {
        emit(SwitchState(isEnabled: false));
      }
    });
  }
}
