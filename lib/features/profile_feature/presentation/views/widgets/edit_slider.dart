import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swe_medical/features/profile_feature/presentation/manager/profile_cubit.dart';
import 'package:swe_medical/features/profile_feature/presentation/views/widgets/custom_container.dart';

import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../record_feature/presentation/widgets/slider_widget.dart';

class EditSlider extends StatefulWidget {
  final String title;
  final int maxInterval;
  final int age;

  final num height;

  final num weight;

  const EditSlider({
    super.key,
    required this.title,
    this.maxInterval = 200,
    this.age = 50,
    this.height = 50,
    this.weight = 50,
  });

  @override
  State<EditSlider> createState() => _EditSliderState();
}

int currentValue = 0;

class _EditSliderState extends State<EditSlider> {
  void getNumber() {
    if (widget.title == AppString.askAge) {
      currentValue = widget.age;
    }
    if (widget.title == AppString.askWeight) {
      currentValue = widget.weight.toInt();
    }
    if (widget.title == AppString.askHeight) {
      currentValue = widget.height.toInt();
    }
  }

  @override
  void initState() {
    super.initState();
    getNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: AppStyle.responsiveFont(fontSize: 20, context: context),
              fontWeight: FontWeight.w500),
        ),
        CustomContainer(
          widget: SliderWidget(
            onChange: (p0) {
              currentValue = p0.toInt();
              if(widget.title==AppString.askAge){
                context.read<ProfileCubit>().age=p0.toInt();
              }
              else if(widget.title==AppString.askWeight){
                context.read<ProfileCubit>().weight=p0.toInt();
              }
              else if(widget.title==AppString.askHeight){
                context.read<ProfileCubit>().height=p0.toInt();
              }
              setState(() {});
            },
            currentValue: currentValue,
            maxInterval: widget.maxInterval,
          ),
        )
      ],
    );
  }
}
