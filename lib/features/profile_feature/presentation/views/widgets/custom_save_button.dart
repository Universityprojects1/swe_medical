import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: MediaQuery.sizeOf(context).height * .08,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(32)),
              color: AppColor.primaryColor),
          child: Center(
            child: Text(
              title,
              style:  TextStyle(
                  fontSize: AppStyle.responsiveFont(fontSize: 24, context: context),
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          )),
    );
  }
}
