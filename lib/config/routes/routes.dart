import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/forget_page.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/sign_up_page.dart';
import 'package:swe_medical/features/home_layout_feature/presentation/manger/home_layout_cubit.dart';
import 'package:swe_medical/features/home_layout_feature/presentation/pages/home_layout_page.dart';
import 'package:swe_medical/features/splash_feature/spalsh_page.dart';

import '../../features/auth_feature/presentation/views/sign_in_page.dart';

class AppRoute {
  static const splash = '/';
  static const homeLayout = '/homeLayout';
  static const signIn = '/SignIn';
  static const signUp = '/SignUp';
  static const forgetPassword = '/ForgetPassword';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: homeLayout,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeLayoutCubit(),
          child: const HomeLayoutPage(),
        ),
      ),
      GoRoute(
        path: signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashBody(),
      ),
      GoRoute(
        path: signUp,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => const ForgetPage(),
      ),
    ],
  );
}
