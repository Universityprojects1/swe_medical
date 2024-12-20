import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swe_medical/features/profile_feature/presentation/manager/profile_cubit.dart';
import 'package:swe_medical/features/profile_feature/presentation/views/widgets/custom_container.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/enums/gender_enum.dart';
import '../../../../record_feature/presentation/widgets/gender_container_widget.dart';

class EditGender extends StatefulWidget {
  const EditGender({
    super.key,
    required this.gender,
  });

  final String gender;

  @override
  State<EditGender> createState() => _EditGenderState();
}

class _EditGenderState extends State<EditGender> {
  bool isSelectMale = false;

  void selected() {
    if (widget.gender == "female") {
      isSelectMale = false;
    } else if (widget.gender == "male") {
      isSelectMale = true;
    }
  }

  @override
  void initState() {
    selected();
    super.initState();
  }

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
        CustomContainer(
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  if (isSelectMale) {
                    return;
                  } else {
                    context.read<ProfileCubit>().gender = Gender.male.name;
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
                    context.read<ProfileCubit>().gender = Gender.female.name;
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
          ),
        )
      ],
    );
  }
}
