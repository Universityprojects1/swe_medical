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
import '../widgets/appointment_detail_item.dart';

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
        backgroundColor: AppColor.primaryColor,
        title:  Text(' Doctor Home Page',style: AppStyle.style24SemiBoldBlack(context),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => const AppointmentDetailItem(),
                  separatorBuilder: (context, index) =>  Divider(
                    color: AppColor.borderLight,
                    thickness: 3,
                  ),
                  itemCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


