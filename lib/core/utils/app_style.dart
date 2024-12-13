import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';

class AppStyle {
  static TextStyle style16MediumPrimaryColor(BuildContext context) {
    return TextStyle(
      color: AppColor.primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: responsiveFont(fontSize: 16, context: context),
    );
  }
  static TextStyle style14LightBlack(BuildContext context) {
    return TextStyle(
      color: AppColor.blackColor,
      fontWeight: FontWeight.w400,
      fontSize: responsiveFont(fontSize: 14, context: context),
    );

  }

  static double scaleFactor(double width) {
    if (width < 500) {
      return width / 400;
    } else if (width > 1200) {
      return width / 1000;
    } else {
      return width / 300;
    }
  }

  static double responsiveFont(
      {required double fontSize, required BuildContext context}) {
    double width = MediaQuery.of(context).size.width;
    double scalefactor = scaleFactor(width);
    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.3;

    double responsiveFont = fontSize * scalefactor;
    return responsiveFont.clamp(lowerLimit, upperLimit);
  }
}
