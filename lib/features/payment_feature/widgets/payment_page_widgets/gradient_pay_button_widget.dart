import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swe_medical/core/utils/app_color.dart';
import 'package:swe_medical/core/utils/app_style.dart';
import 'package:swe_medical/features/payment_feature/manager/payment_cubit/payment_cubit.dart';

class GradientPayButtonWidget extends StatelessWidget {
  const GradientPayButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
      child: ShaderMask(
        shaderCallback: (Rect bounds) =>
            const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.whitePrimaryColor,
                AppColor.primaryColor,
              ],
            ).createShader(bounds),
        // blendMode: BlendMode.srcIn,

        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                PaymentCubit.get(context).createPayment();
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.maxFinite, 50),
                // backgroundColor: AppColor.primaryColor,
              ),
              child: Text(
                "Pay Now",
                style: TextStyle(
                  fontSize:
                  AppStyle.responsiveFont(fontSize: 24, context: context),
                  fontWeight: FontWeight.w600,
                  //    color: AppColor.whiteColor
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
