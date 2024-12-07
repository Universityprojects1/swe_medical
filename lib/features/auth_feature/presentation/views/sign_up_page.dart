import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/app_bar.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_button.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_text_field.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/sign_in_or_sign_up.dart';

import '../../../../config/routes/routes.dart';



class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("New Account"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .08,
              vertical: MediaQuery.sizeOf(context).height * .03),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextField(text: "Your name", title: "Full Name"),
              const Gap(15),
              const CustomTextField(text: "example@example.com", title: "Email"),
              const Gap(15),
              const CustomTextField(
                text: "***************",
                title: "Password",
                isPassword: true,
              ),
              const Gap(15),
              const CustomTextField(text: "Your Number", title: "Mobile Number"),
              const Gap(30),
              const Align(
                alignment: Alignment.center,
                child: CustomButton(
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
    );
  }
}
