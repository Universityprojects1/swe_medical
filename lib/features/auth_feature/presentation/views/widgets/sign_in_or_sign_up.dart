import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';

class SignInOrSignUp extends StatelessWidget {
  const SignInOrSignUp({
    super.key,
    required this.text_1,
    required this.text_2,
  });

  final String text_1;
  final String text_2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text_1),
        Text(
          text_2,
          style: const TextStyle(color: AppColor.primaryColor),
        ),
      ],
    );
  }
}
