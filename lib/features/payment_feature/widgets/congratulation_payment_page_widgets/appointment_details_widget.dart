import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';

import '../../../../core/utils/app_style.dart';
import 'appointment_data_widget.dart';

class AppointmentDetailsWidget extends StatelessWidget {
  const AppointmentDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      // padding: EdgeInsets.symmetric(vertical:  20),
      height: MediaQuery.maybeOf(context)!.size.height * 0.2,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: AppColor.lightPrimaryColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "You have successfully booked\nan appointment with",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize:
              AppStyle.responsiveFont(fontSize: 16, context: context),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "Dr. Emma Hall, M.D.",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize:
              AppStyle.responsiveFont(fontSize: 20, context: context),
              fontWeight: FontWeight.w700,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppointmentDateWidget(icon: Icons.calendar_month,date: "Month 24, Year",),
              AppointmentDateWidget(icon: Icons.access_time_filled_outlined,date: "10:00 aM",)
            ],
          )

        ],
      ),
    );
  }
}
