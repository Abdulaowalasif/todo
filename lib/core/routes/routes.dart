import 'package:go_router/go_router.dart';
import 'package:todo/core/routes/route_name.dart';
import 'package:todo/features/todo/view/add_todo.dart';
import 'package:todo/features/todo/view/home_screen.dart';

import '../../features/splash/view/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      name: RouteName.splash,
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: "/home",
      name: RouteName.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: "/add_todo",
      name: RouteName.add,
      builder: (context, state) => const AddTodo(),
    ),
  ],
);
