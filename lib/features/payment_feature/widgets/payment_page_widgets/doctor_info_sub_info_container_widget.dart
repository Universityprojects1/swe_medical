import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/core/utils/app_style.dart';
class DoctorInfoSubInfoContainerWidget extends StatelessWidget {
  final IconData icon;
  const DoctorInfoSubInfoContainerWidget({
    super.key,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.primaryColor,width: 2)
      ),
      child: Row(
        children: [
          Icon(icon,color: AppColor.primaryColor,),
          const SizedBox(width: 5,),
          Text("5",style: TextStyle(
              fontSize: AppStyle.responsiveFont(fontSize: 14, context: context),
              fontWeight: FontWeight.w300
          ),)
        ],
      ),
    );
  }
}
