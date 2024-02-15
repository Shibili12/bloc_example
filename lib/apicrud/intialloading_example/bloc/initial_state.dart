part of 'initial_bloc.dart';

class InitialState {
  List<Todo> todo = [];
  InitialState({required this.todo});
}

final class InitialInitial extends InitialState {
  InitialInitial() : super(todo: []) {
    getlist();
  }

  Future<void> getlist() async {
    final todos = await ApiHeleper().getProducts();
    todo = todos;
  }
}
