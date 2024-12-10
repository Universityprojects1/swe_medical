import 'package:flutter/material.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/features/payment_feature/widgets/pay_button_widget.dart';
import '../widgets/doctor_full_info_widget.dart';
import '../widgets/payment_info_widget.dart';
import '../widgets/total_amount_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          TotalAmountWidget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: DoctorFullInfoWidget(),
          ),
          Divider(
            thickness: 1,
            color: AppColor.lightPrimaryColor,
            indent: 30,
            endIndent: 30,
          ),
          PaymentInfoWidget(),
          PayButtonWidget()
        ],
      ),
    );
  }
}



