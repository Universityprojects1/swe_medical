import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/core/di/service_locator.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/features/auth_feature/presentation/manger/auth_cubit.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/app_bar.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_button.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_text_field.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/sign_in_or_sign_up.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/services/validation_service.dart';
import '../../data/repo/auth_repo.dart';
import '../../data/repo/auth_repo_impl.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar("Log In"),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .08,
              vertical: MediaQuery.sizeOf(context).height * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              const Gap(30),
              CustomTextField(
                text: "example@example.com",
                title: "Email",
                controller: emailController,
                validator: (p0) => ValidationService.validateEmail(p0),
              ),
              const Gap(15),
              CustomTextField(
                controller: passwordController,
                text: "***************",
                title: "Password",
                isPassword: true,
              ),
              const Gap(5),
              InkWell(
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRoute.forgetPassword);
                },
                child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password",
                      style:
                          TextStyle(fontSize: 12, color: AppColor.primaryColor),
                    )),
              ),
              const Gap(30),
              InkWell(
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRoute.homeLayout);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    onTap: () {},
                    isLogin: true,
                    title: "Log In",
                  ),
                ),
              ),
              const Gap(30),
              InkWell(
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRoute.signUp);
                },
                child: const SignInOrSignUp(
                  text_1: "Don’t have an account? ",
                  text_2: "Sign Up",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
