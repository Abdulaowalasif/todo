import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  List<Map<String, dynamic>> todos = [];

  TodoCubit() : super(const TodoInitialState(todos: []));

  void getTodos() {
    emit(TodoInitialState(todos: List.from(todos)));
  }

  void addTodo(Map<String, dynamic> newTodo) {
    todos.add(Map<String, dynamic>.from(newTodo));
    emit(TodoInitialState(todos: List.from(todos)));
  }

  void deleteTodoByKey(String key, dynamic value) {
    todos.removeWhere((todo) => todo[key] == value);
    emit(TodoInitialState(todos: List.from(todos)));
  }

  void clearTodos() {
    todos.clear();
    emit(TodoInitialState(todos: []));
  }
}
