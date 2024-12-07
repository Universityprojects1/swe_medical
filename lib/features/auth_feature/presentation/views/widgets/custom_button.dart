import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.title,
  });
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          color: AppColor.primaryColor),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * .2,
            vertical: MediaQuery.sizeOf(context).height * .015),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}