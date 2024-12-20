import 'package:flutter/material.dart';
import 'package:swe_medical/features/profile_feature/presentation/views/widgets/custom_container.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/enums/gender_enum.dart';
import '../../../../record_feature/presentation/widgets/gender_container_widget.dart';



class EditGender extends StatelessWidget {
  const EditGender({
    super.key, required this.gender,
  });
  final String gender ;

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
         CustomContainer(widget:  Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             GenderContainerWidget(
               gender: Gender.male,
               isSelected:gender == "male" ? true:false,
             ),
             GenderContainerWidget(
               gender: Gender.female,
               isSelected:gender == "female" ? true:false,
             )
           ],
         ))

      ],
    );
  }
}
