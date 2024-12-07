import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';

AppBar buildAppBar(String title) {
  return AppBar(
    backgroundColor: AppColor.primaryColor,
    centerTitle: true,
    toolbarHeight: 80,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
