import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.widget,  this.width});

  final Widget widget;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height*.05,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(50)),
      child: Center(child: widget),
    );
  }
}
