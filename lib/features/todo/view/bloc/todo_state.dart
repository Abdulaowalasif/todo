part of 'todo_cubit.dart';

@immutable
abstract class TodoState {
  final List<Map<String, dynamic>> todos;

  const TodoState({required this.todos});
}

class TodoInitialState extends TodoState {
  const TodoInitialState({required List<Map<String, dynamic>> todos})
    : super(todos: todos);
}
