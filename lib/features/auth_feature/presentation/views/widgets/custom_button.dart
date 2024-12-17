import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/config/routes/routes.dart';
import 'package:swe_medical/core/services/snack_bar_services.dart';
import 'package:swe_medical/features/auth_feature/presentation/manger/auth_cubit.dart';

import '../../../../../../core/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.isLogin,
    this.onTap,
  });

  final String title;

  final bool isLogin;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.sizeOf(context).height * .08,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            color: AppColor.primaryColor),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is AuthErrorState){
              SnackBarServices.showErrorMessage(context, state.error);

            }
            else if(state is AuthSuccessState){
              context.go(AppRoute.homeLayout);
            }
          },
          builder: (context, state) {
            if (state is AuthLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            );
          },
        ),
      ),
    );
  }
}
