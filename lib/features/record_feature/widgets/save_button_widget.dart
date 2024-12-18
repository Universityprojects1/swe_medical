import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swe_medical/config/routes/routes.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/app_style.dart';
import '../manager/record_cubit.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print(context.read<RecordCubit>().age.toString());
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.whiteColor,
            side: const BorderSide(
              color: AppColor.primaryColor, // Cyan border color
              width: 1, // Border width
            )),
        child: Text("Save",
            style: TextStyle(
                fontSize: AppStyle.responsiveFont(
                    fontSize: 24, context: context),
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600)));
  }
}
