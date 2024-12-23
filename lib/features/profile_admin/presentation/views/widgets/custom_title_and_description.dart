import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/core/utils/app_style.dart';

class CustomTitleAndDescription extends StatelessWidget {
  const CustomTitleAndDescription({
    super.key, required this.title, required this.description,
  });
  final String title ;
  final String description ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColor.primaryColor,
            fontSize: AppStyle.responsiveFont(
                fontSize: 16, context: context),
          ),
        ),
        Divider(
          color: AppColor.borderLight,
        ),
        Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: AppColor.blackColor,
            fontSize: AppStyle.responsiveFont(
                fontSize: 14, context: context),
          ),
        ),
      ],
    );
  }
}
