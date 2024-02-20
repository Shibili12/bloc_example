part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent extends Equatable {}

class AddtodoEvent extends TodoEvent {
  final String task;
  AddtodoEvent({required this.task});
  @override
  // TODO: implement props
  List<Object?> get props => [task];
}

class DeleteTodoEvent extends TodoEvent {
  final Object task;
  DeleteTodoEvent({required this.task});
  @override
  // TODO: implement props
  List<Object?> get props => [task];
}
