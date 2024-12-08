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
      height:MediaQuery.sizeOf(context).height * .08 ,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          color: AppColor.primaryColor),
      child: Center(
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