
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';





class AppRoute {
  static const login = '/login';
  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: login,
      //   builder: (context, state) => const LoginPage(), // هنا يتم تعريف صفحة تسجيل الدخول
      // ),
    ],
  );
}
