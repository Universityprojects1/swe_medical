import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/core/utils/app_style.dart';
import '../../../generated/assets.dart';

import '../widgets/doctor_full_info_widget.dart';
import '../widgets/total_amount_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(
        children: [
          TotalAmountWidget(),
           Padding(
             padding: EdgeInsets.symmetric(vertical: 20),
             child: DoctorFullInfoWidget(),
           ),
        ],
      ),
    );
  }
}







