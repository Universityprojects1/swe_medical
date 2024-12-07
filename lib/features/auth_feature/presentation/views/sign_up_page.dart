import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/app_bar.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_button.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_text_field.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/sign_in_or_sign_up.dart';



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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(text: "Your name", title: "Full Name"),
              Gap(15),
              CustomTextField(text: "example@example.com", title: "Email"),
              Gap(15),
              CustomTextField(
                text: "***************",
                title: "Password",
                isPassword: true,
              ),
              Gap(15),
              CustomTextField(text: "Your Number", title: "Mobile Number"),
              Gap(30),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  title: "Sign Up",
                ),
              ),
              Gap(30),
              SignInOrSignUp(
                text_1: "already have an account? ",
                text_2: "Log in",
              )
            ],
          ),
        ),
      ),
    );
  }
}
