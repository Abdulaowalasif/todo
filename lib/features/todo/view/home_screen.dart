import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/routes/route_name.dart';
import 'package:todo/core/theme/app_color.dart';
import 'package:todo/core/todos.dart';
import 'package:todo/features/todo/view/bloc/todo_cubit.dart';
import 'package:todo/features/todo/view/bloc/todo_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> todos = {};

  @override
  Widget build(BuildContext context) {
    context.read<TodoCubit>().getTodos();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        title: Text(
          "Todos",
          style: TextStyle(
            color: AppColor.snackBarBlue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.todos.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColor.snackBarBlue,
                  child: Text('${index + 1}'),
                ),
                title: Text(state.todos[index]["title"]),
                subtitle: Text(state.todos[index]["description"]),
              ),
            );
          } else {
            return Center(child: Text("No todos found"));
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            shape: StadiumBorder(),
            backgroundColor: AppColor.snackBarBlue,
            onPressed: () {
              context.goNamed(RouteName.add);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            shape: StadiumBorder(),
            backgroundColor: AppColor.snackBarBlue,
            onPressed: () {
             context.read<TodoCubit>().clearTodos();
            },
            child: Icon(Icons.clear_all),
          ),
        ],
      ),
    );
  }
}
