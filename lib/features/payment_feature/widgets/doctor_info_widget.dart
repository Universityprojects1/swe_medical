import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/core/utils/app_style.dart';
import 'doctor_info_sub_info_container_widget.dart';
class DoctorInfoWidget extends StatelessWidget {
  const DoctorInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.maybeOf(context)!.size.height*0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Dr Ahmed",
            style: TextStyle(fontSize: AppStyle.responsiveFont(fontSize: 20, context: context),
                color:AppColor.primaryColor,fontWeight: FontWeight.w400),
          ),
          Text("General Doctor",
            style: TextStyle(fontSize: AppStyle.responsiveFont(fontSize: 18, context: context),
                fontWeight: FontWeight.w300
            ),
          ),
          const Row(
            children: [
              DoctorInfoSubInfoContainerWidget(icon: Icons.star,),
              SizedBox(width: 10,),
              DoctorInfoSubInfoContainerWidget(icon: Icons.message_outlined,),
            ],
          ),

        ],
      ),
    );
  }
}
