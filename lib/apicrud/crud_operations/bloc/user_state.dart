part of 'user_bloc.dart';

class UserState {
  final bool isLoading;
  final List<User> user;

  UserState({required this.isLoading, required this.user});
}

final class UserInitial extends UserState {
  UserInitial({required super.isLoading, required super.user});
}
