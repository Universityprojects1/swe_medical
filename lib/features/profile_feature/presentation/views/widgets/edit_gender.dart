import 'package:flutter/material.dart';
import 'package:swe_medical/features/profile_feature/presentation/views/widgets/custom_container.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/enums/gender_enum.dart';
import '../../../../record_feature/widgets/gender_container_widget.dart';


class EditGender extends StatelessWidget {
  const EditGender({
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
              fontSize: AppStyle.responsiveFont(fontSize: 20, context: context),
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
         const CustomContainer(widget:  Row(
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
         ))

      ],
    );
  }
}
