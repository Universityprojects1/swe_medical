import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/features/payment_feature/manager/payment_cubit/payment_cubit.dart';
import '../widgets/payment_page_widgets/doctor_full_info_widget.dart';
import '../widgets/payment_page_widgets/gradient_pay_button_widget.dart';
import '../widgets/payment_page_widgets/payment_info_widget.dart';
import '../widgets/payment_page_widgets/total_amount_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: const Scaffold(
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
            GradientPayButtonWidget()
          ],
        ),
      ),
    );
  }
}
