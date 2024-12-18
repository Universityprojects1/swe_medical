import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swe_medical/config/routes/routes.dart';
import 'package:swe_medical/core/utils/app_string.dart';
import 'package:swe_medical/features/record_feature/widgets/slider_widget.dart';
import '../../../core/utils/app_style.dart';
import '../manager/record_cubit.dart';


class SectionWidget extends StatefulWidget {
  final String title;
  final int maxInterval;
  const SectionWidget({super.key, required this.title, this.maxInterval = 200});

  @override
  State<SectionWidget> createState() => _SectionWidgetState();
}
int currentValue=50;

class _SectionWidgetState extends State<SectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              fontSize: AppStyle.responsiveFont(fontSize: 15, context: context),
              fontWeight: FontWeight.w500),
        ),
        SliderWidget(
          onChange: (p0) {
            currentValue=p0.toInt();
            if(widget.title==AppString.askAge){
              context.read<RecordCubit>().age=p0.toInt();
            }
            else if(widget.title==AppString.askWeight){
              context.read<RecordCubit>().weight=p0.toInt();
            }
            else if(widget.title==AppString.askHeight){
              context.read<RecordCubit>().height=p0.toInt();
            }

            setState(() {

            });
          },
          currentValue: currentValue,
          maxInterval: widget.maxInterval,
        )
      ],
    );
  }
}
