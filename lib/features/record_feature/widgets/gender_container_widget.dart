import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/enums/gender_enum.dart';
class GenderContainerWidget extends StatelessWidget {
  final Gender gender;
  final bool isSelected;
  const GenderContainerWidget(
      {super.key, required this.gender, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? null
              : Border.all(color: AppColor.primaryColor, width: 2),
          gradient: isSelected
              ? const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColor.whitePrimaryColor, AppColor.primaryColor])
              : null),
      child: Text(
        gender.name,
        style: TextStyle(
            fontSize: AppStyle.responsiveFont(fontSize: 16, context: context),
            color: isSelected ? AppColor.whiteColor : AppColor.blackColor,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
