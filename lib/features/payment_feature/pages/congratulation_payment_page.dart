import 'package:flutter/material.dart';

import '../widgets/congratulation_payment_page_widgets/appointment_details_widget.dart';
import '../widgets/congratulation_payment_page_widgets/custom_gradient_app_bar_widget.dart';
import '../widgets/congratulation_payment_page_widgets/gradient_return_button_widget.dart';
import '../widgets/congratulation_payment_page_widgets/payment_congratulation_message_widget.dart';

class CongratulationPaymentPage extends StatelessWidget {
  const CongratulationPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomGradientAppBarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.maybeOf(context)!.size.width,
          ),
          const PaymentCongratulationMessageWidget(),
         const AppointmentDetailsWidget(),
         const GradientReturnButtonWidget(),
        ],
      ),
    );
  }
}





