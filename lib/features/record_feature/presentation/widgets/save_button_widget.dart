import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/config/routes/routes.dart';
import 'package:swe_medical/core/services/snack_bar_services.dart';
import 'package:swe_medical/core/utils/helper.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_style.dart';

import '../manager/record_cubit.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecordCubit, RecordState>(
      listener: (context, state) {
        if (state is SetRecordSuccessState) {
          context.go(AppRoute.homeLayout);
        } else if (state is SetRecordFailState) {
          SnackBarServices.showErrorMessage(context, state.message);
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            var id = Helper.returnUser().patientId;
            context.read<RecordCubit>().setRecord(id ?? "");
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.whiteColor,
              side: const BorderSide(
                color: AppColor.primaryColor, // Cyan border color
                width: 1, // Border width
              )),
          child: BlocBuilder<RecordCubit, RecordState>(
            builder: (context, state) {
              if (state is SetRecordLoadingState) {
                return const CircularProgressIndicator();
              }
              return Text(
                "Save",
                style: TextStyle(
                    fontSize:
                        AppStyle.responsiveFont(fontSize: 24, context: context),
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w600),
              );
            },
          ),
        );
      },
    );
  }
}
