import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];
  TodoBloc() : super(TodoInitial()) {
    on<AddtodoEvent>((event, emit) {
      todoList.add(event.task);
      emit(TodoState(todoList: List.from(todoList)));
    });
    on<DeleteTodoEvent>((event, emit) {
      todoList.remove(event.task);
      emit(TodoState(todoList: List.from(todoList)));
    });
  }
}
