import 'package:flutter/material.dart';
import 'package:swe_medical/features/profile_feature/presentation/views/widgets/custom_container.dart';
import 'package:swe_medical/features/record_feature/widgets/slider_widget.dart';
import '../../../../../core/utils/app_style.dart';



class EditSlider extends StatelessWidget {
  final String title;
  final int maxInterval;
  const EditSlider({super.key, required this.title, this.maxInterval = 200});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: AppStyle.responsiveFont(fontSize: 20, context: context),
              fontWeight: FontWeight.w500),
        ),
        CustomContainer(
          widget: SliderWidget(
            currentValue: 50,
            maxInterval: maxInterval,
          ),
        )
      ],
    );
  }
}
