import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:swe_medical/config/routes/routes.dart';
import 'package:swe_medical/core/cache/storage_token.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/features/home_layout_feature/presentation/manger/home_layout_cubit.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../generated/assets.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeLayoutPage extends StatelessWidget {
  const HomeLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: InkWell(
          onTap: () {
             getIt<StorageToken>().deleteToken();
             context.go(AppRoute.signIn);

          },
          child: Image.asset(
            Assets.imagesLogoutIcon,
            color: Colors.red,
          ),
        ),
      ),
      body: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
        builder: (context, state) {
          return state.page;
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
