import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/core/di/service_locator.dart';
import 'package:swe_medical/features/auth_feature/data/model/request/UserRequest.dart';
import 'package:swe_medical/features/auth_feature/data/repo/auth_repo_impl.dart';
import 'package:swe_medical/features/auth_feature/presentation/manger/auth_cubit.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/app_bar.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_button.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_text_field.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/sign_in_or_sign_up.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/services/validation_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("New Account"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .08,
              vertical: MediaQuery.sizeOf(context).height * .03),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  text: "Your name",
                  title: "Full Name",
                  controller: nameController,
                ),
                const Gap(15),
                CustomTextField(
                  text: "example@example.com",
                  title: "Email",
                  controller: emailController,
                  validator: (p0) => ValidationService.validateEmail(p0),
                ),
                const Gap(15),
                CustomTextField(
                  text: "***************",
                  title: "Password",
                  isPassword: true,
                  controller: passwordController,
                ),
                const Gap(15),
                CustomTextField(
                  controller: numberController,
                  text: "Your Number",
                  title: "Mobile Number",
                ),
                const Gap(30),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        UserRequest userRequest = UserRequest(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            mobile: numberController.text);
                        AuthCubit.get(context).signUp(userRequest);
                      }
                    },
                    isLogin: false,
                    title: "Sign Up",
                  ),
                ),
                const Gap(30),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRoute.signIn);
                  },
                  child: const SignInOrSignUp(
                    text_1: "already have an account? ",
                    text_2: "Log in",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
