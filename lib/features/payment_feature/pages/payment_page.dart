import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swe_medical/core/utils/Model/PatientModel.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/model/AppointmentModel.dart';
import 'package:swe_medical/features/payment_feature/manager/payment_cubit/payment_cubit.dart';
import '../widgets/payment_page_widgets/doctor_full_info_widget.dart';
import '../widgets/payment_page_widgets/gradient_pay_button_widget.dart';
import '../widgets/payment_page_widgets/payment_info_widget.dart';
import '../widgets/payment_page_widgets/total_amount_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppointmentModel patient =
        GoRouterState.of(context).extra! as AppointmentModel;
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        body: Column(
          children: [
            const TotalAmountWidget(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: DoctorFullInfoWidget(),
            ),
            const Divider(
              thickness: 1,
              color: AppColor.lightPrimaryColor,
              indent: 30,
              endIndent: 30,
            ),
            PaymentInfoWidget(
              appointmentModel: patient,
            ),
            const GradientPayButtonWidget()
          ],
        ),
      ),
    );
  }
}
