import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/core/utils/app_style.dart';

class PayButtonWidget extends StatelessWidget {
  const PayButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize:const Size(double.maxFinite, 50),
          backgroundColor: AppColor.primaryColor,
        ),
        child: Text(
          "Pay Now",
          style: TextStyle(
              fontSize:
              AppStyle.responsiveFont(fontSize: 24, context: context),
              fontWeight: FontWeight.w600,
              color: AppColor.whiteColor),
        ),
      ),
    );
  }
}
