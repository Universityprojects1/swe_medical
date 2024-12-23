import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'doctor_image_widget.dart';
import 'doctor_info_widget.dart';

class DoctorFullInfoWidget extends StatelessWidget {
  const DoctorFullInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const DoctorImageWidget(imageUrl: '',),
        DoctorInfoWidget(),
        Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                color: AppColor.primaryColor,
                shape: BoxShape.circle
            ),
            child: const Icon(Icons.workspace_premium,color: AppColor.whiteColor,size: 30
              ,))
      ],
    );
  }
}
