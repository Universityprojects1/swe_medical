import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/app_bar.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_button.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_text_field.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/sign_in_or_sign_up.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Log In"),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * .08,
            vertical: MediaQuery.sizeOf(context).height * .03),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
            Gap(30),
            CustomTextField(text: "example@example.com", title: "Email"),
            Gap(15),
            CustomTextField(
              text: "***************",
              title: "Password",
              isPassword: true,
            ),
            Gap(5),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password",
                  style: TextStyle(fontSize: 12, color: AppColor.primaryColor),
                )),
            Gap(30),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                title: "Log In",
              ),
            ),
            Gap(30),
            SignInOrSignUp(
              text_1: "Don’t have an account? ",
              text_2: "Sign Up",
            )
          ],
        ),
      ),
    );
  }
}
