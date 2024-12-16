import 'package:flutter/material.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/enums/gender_enum.dart';
import 'gender_container_widget.dart';

class GenderSectionWidget extends StatelessWidget {
  const GenderSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is your gender",
          style: TextStyle(
              fontSize: AppStyle.responsiveFont(fontSize: 15, context: context),
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GenderContainerWidget(
              gender: Gender.male,
              isSelected: false,
            ),
            GenderContainerWidget(
              gender: Gender.female,
              isSelected: true,
            )
          ],
        )
      ],
    );
  }
}
