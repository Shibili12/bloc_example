part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class Fetchuser extends UserEvent {}

class Postuser extends UserEvent {
  final User user;

  Postuser({required this.user});
}

class UpdateUser extends UserEvent {
  final int id;
  final User user;

  UpdateUser(this.id, this.user);
}

class DeleteUser extends UserEvent {
  final int id;

  DeleteUser(this.id);
}
