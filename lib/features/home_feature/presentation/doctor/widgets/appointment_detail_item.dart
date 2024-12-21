import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/model/AppointmentModel.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/assets.dart';

class AppointmentDetailItem extends StatelessWidget {
  const AppointmentDetailItem({super.key, required this.appointmentModel});

  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender: ${appointmentModel.patientGender}"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointmentModel.patientName ?? "No Name",
                    style: AppStyle.style16MediumPrimaryColor(context),
                  ),
                  Text(
                    AppString.patient,
                    style: AppStyle.style14LightBlack(context),
                  ),
                ],
              ),
            ],
          ),
          const Gap(26),
          Row(
            children: [
              TimeContainer(
                icon: Assets.imagesBooking,
                data: appointmentModel.date ?? "No Date",
              ),
              const Gap(7),
              TimeContainer(
                icon: Assets.imagesClockIcon,
                data: appointmentModel.time ?? "No Time",
              ),
            ],
          ),
          const Gap(10),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AcceptAndDeclineButton(
                  icon: Icons.check,
                  onTap: () {},
                ),
                const Gap(10),
                AcceptAndDeclineButton(
                  icon: Icons.close,
                  onTap: () {
                    // Decline
                  },
                ),
              ],
            ),
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
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(20),
          ),
          height: 40,
          width: 40,
          child: Icon(
            icon,
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
