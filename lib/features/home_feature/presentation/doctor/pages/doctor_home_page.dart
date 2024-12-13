import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/core/utils/app_string.dart';
import 'package:time_slot/model/time_slot_Interval.dart';
import 'package:time_slot/time_slot_from_interval.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/assets.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<DoctorHomePage> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Doctor Home Page'),
      ),
      body: const Center(
        child: Column(
          children: [AppointmentDetail()],
        ),
      ),
    );
  }
}

class AppointmentDetail extends StatelessWidget {
  const AppointmentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.maxFinite,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. Madison Clark, Ph.D.",
                  style: AppStyle.style16MediumPrimaryColor(context),
                ),
                Text(
                  AppString.patient,
                  style: AppStyle.style14LightBlack(context),
                ),
              ],
            ),
          ),
          const Gap(26),
           Row(
            children: [
              const TimeContainer(icon: Assets.imagesBooking, data: "Sunday, 12 June"),
              const Gap(7),
              const TimeContainer(icon: Assets.imagesClockIcon, data: "9:30 AM - 10:00 AM"),
              Row(
                children: [
                  AcceptAndDeclineButton(
                    icon: Icons.check,
                    onTap: () {

                    },
                  ),
                  const Gap(10),
                  AcceptAndDeclineButton(
                    icon: Icons.close,
                    onTap: () {
                      // Decline
                    },
                  ),
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}

class TimeContainer extends StatelessWidget {
  const TimeContainer({super.key, required this.icon, required this.data});

  final String icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF33E4DB)),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 10,
            height: 10,
          ),
          const Gap(4),
          Text(
            data,
            style: AppStyle.style14LightBlack(context),
          )
        ],
      ),
    );
  }
}
class AcceptAndDeclineButton extends StatelessWidget {
  const AcceptAndDeclineButton({super.key, required this.icon, this.onTap});
 final IconData icon;
final  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          height: 40,
          width: 40,
          color: AppColor.primaryColor,
          child:  Icon(
            icon,
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}

