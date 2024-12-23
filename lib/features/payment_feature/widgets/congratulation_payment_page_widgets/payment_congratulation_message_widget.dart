import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';

import '../../../../core/utils/app_style.dart';

class PaymentCongratulationMessageWidget extends StatelessWidget {
  const PaymentCongratulationMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) => const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.whitePrimaryColor,
              AppColor.whitePrimaryColor,
              AppColor.primaryColor,
              AppColor.primaryColor,
            ],
          ).createShader(bounds),
          blendMode: BlendMode.srcIn,
          child: Icon(
            Icons.check_circle_outline_rounded,
            size: MediaQuery.maybeOf(context)!.size.height * 0.25,
            color: Colors.white, // Necessary for ShaderMask
          ),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) => const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.whitePrimaryColor,
              AppColor.primaryColor,
            ],
          ).createShader(bounds),
          blendMode: BlendMode.srcIn,
          child: Text(
            "Congratulations",
            style: TextStyle(
              fontSize: AppStyle.responsiveFont(fontSize: 40, context: context),
              fontWeight: FontWeight.w600,
              color: Colors.white, // Necessary for ShaderMask
            ),
          ),
        ),
        Text(
          "Payment is Successfully",
          style: TextStyle(
            fontSize: AppStyle.responsiveFont(fontSize: 20, context: context),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
