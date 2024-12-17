import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/component/custom_gradient_app_bar_widget.dart';

import '../widgets/blood_type_drop_down_widget.dart';
import '../widgets/gender_section_widget.dart';
import '../widgets/save_button_widget.dart';
import '../widgets/section_widget.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomGradientAppBarWidget(title: "Record"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GenderSectionWidget(),
            SectionWidget(
              title: "How old are you",
              maxInterval: 100,
            ),
            SectionWidget(
              title: "What is your weight",
            ),
            SectionWidget(
              title: "What is your height",
            ),
            BloodTypeDropdownWidget(),
            SaveButtonWidget()
          ],
        ),
      ),
    );
  }
}
