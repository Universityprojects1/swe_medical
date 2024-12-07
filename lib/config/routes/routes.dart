import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/features/home_layout_feature/presentation/pages/home_layout_page.dart';

class AppRoute {
  static const homeLayout = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(
          path: homeLayout,
          builder: (context, state) => const HomeLayoutPage()),
    ],
  );
}
