import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/config/routes/routes.dart';
import 'package:swe_medical/core/utils/app_color.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SvgPicture.asset(
              "assets/images/splash.svg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LoginSignButton(
                  text: "Log In",
                  onTap: () {
                    context.push(AppRoute.signIn);
                  },
                ),
                const Gap(10),
                LoginSignButton(
                  text: "Sign Up",
                  onTap: () {
                    context.push(AppRoute.signUp);
                  },
                ),
                const Gap(30)
              ],
            )
          ],
        ));
  }
}

class LoginSignButton extends StatelessWidget {
  const LoginSignButton({super.key, required this.text, required this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
