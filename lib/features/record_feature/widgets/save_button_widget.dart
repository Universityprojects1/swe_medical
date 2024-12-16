import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.whiteColor,
            side: const BorderSide(
              color: AppColor.primaryColor, // Cyan border color
              width: 1, // Border width
            )),
        child: Text("Save",
            style: TextStyle(
                fontSize: AppStyle.responsiveFont(
                    fontSize: 24, context: context),
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600)));
  }
}
