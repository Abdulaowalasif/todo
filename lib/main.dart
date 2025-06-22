import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/routes/routes.dart';
import 'package:todo/core/theme/app_theme.dart';
import 'package:todo/core/utils/app_strings.dart';
import 'package:todo/features/todo/view/bloc/todo_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCubit>(
      create: (context) => TodoCubit(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: AppString.appName,
        theme: AppTheme.darkTheme,
        routerConfig: router,
      ),
    );
  }
}
