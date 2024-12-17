import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/app_bar.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_button.dart';
import 'package:swe_medical/features/auth_feature/presentation/views/widgets/custom_text_field.dart';

class ForgetPage extends StatelessWidget {
  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Set Password"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .08,
              vertical: MediaQuery.sizeOf(context).height * .03),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                text: "***************",
                title: "Password",
                isPassword: true,
              ),
              Gap(15),
              CustomTextField(
                text: "***************",
                title: "Confirm Password",
                isPassword: true,
              ),
              Gap(30),
              // Align(
              //   alignment: Alignment.center,
              //   child: CustomButton(
              //     title: "Create New Password",
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
