import 'package:bloc/bloc.dart';
import 'package:bloc_example/apicrud/intialloading_example/model/todomodel.dart';
import 'package:bloc_example/apicrud/intialloading_example/service/apihelper.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'initial_event.dart';
part 'initial_state.dart';

class InitialBloc extends Bloc<InitialEvent, InitialState> {
  InitialBloc() : super(InitialInitial()) {
    on<GetList>((event, emit) async {
      try {
        final list = await ApiHeleper().getProducts();
        emit(InitialState(todo: list));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
