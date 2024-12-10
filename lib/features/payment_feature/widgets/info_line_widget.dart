import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/core/utils/app_style.dart';

class InfoLineWidget extends StatelessWidget {
  final String label;
  final String field;

  const InfoLineWidget({super.key, required this.label, required this.field});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize:
                AppStyle.responsiveFont(fontSize: 15, context: context),
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w400),
          ),
          Text(
            field,
            style: TextStyle(
                fontSize:
                AppStyle.responsiveFont(fontSize: 15, context: context),
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
