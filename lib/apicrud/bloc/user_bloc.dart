import 'package:bloc/bloc.dart';
import 'package:bloc_example/apicrud/model/usermodel.dart';
import 'package:bloc_example/apicrud/sevice/apiservice.dart';

import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial(isLoading: false, user: [])) {
    on<Fetchuser>((event, emit) async {
      emit(UserState(user: [], isLoading: true));
      try {
        final user = await Apiservice().getUser();
        emit(
          UserState(user: user, isLoading: false),
        );
      } catch (e) {
        // emit(UserError(e.toString(), users: [], message: ''));
      }
    });
    on<Postuser>((event, emit) async {
      emit(UserState(user: [], isLoading: true));
      try {
        final user = await Apiservice().createUser(event.user);
        emit(UserState(user: user, isLoading: false));
      } catch (e) {
        // emit(UserError(e.toString(), users: [], message: ''));
      }
    });

    on<UpdateUser>((event, emit) async {
      emit(UserState(user: [], isLoading: true));
      try {
        final user = await Apiservice().updateUser(event.id, event.user);
        emit(UserState(user: user, isLoading: false));
      } catch (e) {
        // emit(UserError(e.toString(), users: [], message: ''));
      }
    });

    on<DeleteUser>((event, emit) async {
      emit(UserState(user: [], isLoading: true));
      try {
        final user = await Apiservice().deleteUser(event.id);
        emit(UserState(user: user, isLoading: false));
      } catch (e) {
        // emit(UserError(e.toString(), users: [], message: ''));
      }
    });
  }
}
