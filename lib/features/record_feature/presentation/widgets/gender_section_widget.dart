import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_style.dart';
import '../../../../core/utils/enums/gender_enum.dart';

import '../manager/record_cubit.dart';
import 'gender_container_widget.dart';

class GenderSectionWidget extends StatefulWidget {
  const GenderSectionWidget({
    super.key,
  });

  @override
  State<GenderSectionWidget> createState() => _GenderSectionWidgetState();
}

class _GenderSectionWidgetState extends State<GenderSectionWidget> {
  bool isSelectMale = false;

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                if (isSelectMale) {
                  return;
                } else {
                  context.read<RecordCubit>().gender=Gender.male.name;
                  setState(() {
                    isSelectMale = true;
                  });
                }
              },
              child: GenderContainerWidget(
                gender: Gender.male,
                isSelected: isSelectMale,
              ),
            ),
            InkWell(
              onTap: () {
                if (!isSelectMale) {
                  return;
                } else {
                   context.read<RecordCubit>().gender=Gender.female.name;
                  setState(() {
                    isSelectMale = false;
                  });
                }
              },
              child: GenderContainerWidget(
                gender: Gender.female,
                isSelected: !isSelectMale,
              ),
            )
          ],
        )
      ],
    );
  }
}
