import 'package:flutter/material.dart';




import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';

class TotalAmountWidget extends StatelessWidget {
  const TotalAmountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          AppStyle.responsiveFont(fontSize: 15, context: context)),
      width: double.maxFinite,
      height: MediaQuery.maybeOf(context)!.size.height * 0.2,
      decoration: const BoxDecoration(
        color: AppColor.primaryColor,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColor.whitePrimaryColor, AppColor.primaryColor],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.whiteColor,
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.maybeOf(context)!.size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Payment",
                  style: TextStyle(
                    fontSize:
                        AppStyle.responsiveFont(fontSize: 24, context: context),
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "\$ 100.00",
                  style: TextStyle(
                      fontSize: AppStyle.responsiveFont(
                          fontSize: 48, context: context),
                      fontWeight: FontWeight.w600,
                      color: AppColor.whiteColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
