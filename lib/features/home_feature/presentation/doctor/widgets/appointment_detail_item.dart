import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:swe_medical/config/routes/routes.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/model/AppointmentModel.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/presentation/manger/doctor_home_cubit.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/assets.dart';

class AppointmentDetailItem extends StatelessWidget {
  const AppointmentDetailItem({super.key, required this.appointmentModel});

  final AppointmentModel appointmentModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(26),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(0, 2),
                blurRadius: 5,
              ),
            ],
          ),
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
                      const Gap(5),
                      Text("phone: ${appointmentModel.phone}"),
                      const Gap(5),
                      Text("weight: ${appointmentModel.weight}"),

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
                      isConfirmed: appointmentModel.isConfirmed ?? false,
                      icon: Icons.check,
                      onTap: () {
                        context
                            .read<DoctorHomeCubit>()
                            .confirmAppointment(appointmentModel.dateTime ?? "");
                      },
                    ),
                    const Gap(10),
                    appointmentModel.isConfirmed ?? false
                        ? const SizedBox()
                        :
                    AcceptAndDeclineButton(
                      isConfirmed: false,
                      icon: Icons.close,
                      onTap: () {
                        context
                            .read<DoctorHomeCubit>()
                            .deleteAppointment(appointmentModel.dateTime ?? "");
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          decoration:  BoxDecoration(
            color: appointmentModel.isPaid??false? Colors.green:Colors.grey,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              appointmentModel.isPaid ?? false
                  ? "Is Paid"
                  : "Not Paid",
              style:AppStyle.style14LightBlack(context),
            ),
          ),
        )
      ],
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
  const AcceptAndDeclineButton({super.key, required this.icon, this.onTap, required this.isConfirmed});

  final IconData icon;
  final void Function()? onTap;
  final bool isConfirmed ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipOval(
        child: Container(
          decoration: BoxDecoration(
            color: isConfirmed?  Colors.green : Colors.transparent,
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
