import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';

class CustomGradientAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const CustomGradientAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColor.whitePrimaryColor, AppColor.primaryColor])),
      child: AppBar(
        toolbarHeight: 600,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.whiteColor,
            )),

        title: Text(
          "Payment",
          style: TextStyle(
              fontSize: AppStyle.responsiveFont(fontSize: 24, context: context),
              color: AppColor.whiteColor,
              fontWeight: FontWeight.w600),
        ),

        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove shadow for a flat appearance
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
