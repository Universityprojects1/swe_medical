import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';

import '../../../../core/utils/app_style.dart';


class GradientReturnButtonWidget extends StatelessWidget {
  const GradientReturnButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30,left: 30,right: 30),
      child: ShaderMask(
        shaderCallback: (Rect bounds) => const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.whitePrimaryColor,
            AppColor.primaryColor,
          ],
        ).createShader(bounds),
        // blendMode: BlendMode.srcIn,

        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize:const Size(double.maxFinite, 50),
            // backgroundColor: AppColor.primaryColor,
          ),
          child: Text(
            "Return Now",
            style: TextStyle(
              fontSize:
              AppStyle.responsiveFont(fontSize: 24, context: context),
              fontWeight: FontWeight.w600,
              //    color: AppColor.whiteColor
            ),
          ),
        ),
      ),
    );
  }
}
