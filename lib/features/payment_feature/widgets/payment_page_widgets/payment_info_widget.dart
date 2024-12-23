import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/model/AppointmentModel.dart';

import 'info_line_widget.dart';
class PaymentInfoWidget extends StatelessWidget {
  const PaymentInfoWidget({
    super.key,
    required this.appointmentModel,
  });
final AppointmentModel appointmentModel;
  @override
  Widget build(BuildContext context) {

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoLineWidget(
          label: "Your name",
          field:appointmentModel.patientName??"",
        ),
        InfoLineWidget(
          label: "Date",
          field: appointmentModel.dateTime??"",
        ),

        InfoLineWidget(
          label: "Pay status",
          field: appointmentModel.isPaid??false?"Paid":"Not Paid",
        ),

      ],
    );
  }
}
