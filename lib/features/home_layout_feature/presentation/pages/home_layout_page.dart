import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/config/routes/routes.dart';
import 'package:swe_medical/core/cache/storage_token.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/features/home_layout_feature/presentation/manger/home_layout_cubit.dart';

import '../../../../core/cache/hive/hive_keyes.dart';
import '../../../../core/cache/hive/hive_manager.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/Model/PatientModel.dart';
import '../../../../generated/assets.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeLayoutPage extends StatelessWidget {
  const HomeLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var userId = getIt<HiveManager>()
        .retrievePerson<PatientModel>(HiveKeys.patientBox, 0)
        .patientId ??
        "";
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
        actions: [
          userId!="iRLlMW6ShsMWwp4kjlzoTQj8v6k1"? InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.doctorProfile);
            },
            child: const Text(
              "Profile Doctor",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  decorationStyle: TextDecorationStyle.double),
            ),
          ):const SizedBox(),
          SizedBox(width: MediaQuery.sizeOf(context).width*.03,)
        ],
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
