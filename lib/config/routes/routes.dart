import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/features/home_layout_feature/presentation/manger/home_layout_cubit.dart';
import 'package:swe_medical/features/home_layout_feature/presentation/pages/home_layout_page.dart';

import '../../features/auth_feature/presentation/views/sign_in_page.dart';

class AppRoute {
  static const homeLayout = '/';
  static const signIn = '/SignIn';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: signIn,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeLayoutCubit(),
          child: const HomeLayoutPage(),
        ),
      ),
      GoRoute(
        path: homeLayout,
        builder: (context, state) => const SignInPage(),
      ),
    ],
  );
}
