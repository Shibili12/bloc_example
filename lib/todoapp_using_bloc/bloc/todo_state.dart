part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<String> todoList;

  TodoState({this.todoList = const []});

  TodoState copyWith({List<String>? todoList}) {
    return TodoState(todoList: todoList ?? this.todoList);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [todoList];
}

final class TodoInitial extends TodoState {}
