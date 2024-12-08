import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/app_bar.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_button.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_text_field.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/sign_in_or_sign_up.dart';

import '../../../../config/routes/routes.dart';

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
        child:  Column(
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
            const CustomTextField(text: "example@example.com", title: "Email"),
            const Gap(15),
            const CustomTextField(
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
                    style: TextStyle(fontSize: 12, color: AppColor.primaryColor),
                  )),
             ),
            const Gap(30),
            InkWell(
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRoute.homeLayout);
              },
              child: const Align(
                alignment: Alignment.center,
                child: CustomButton(
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
    );
  }
}
