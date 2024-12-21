import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:swe_medical/core/api/fire_base_helper.dart';
import 'package:swe_medical/core/services/stripe_payment_services/models/payment_intent_input_model.dart';
import 'package:swe_medical/features/home_feature/presentation/patient/data/model/AppointmentModel.dart';

import '../../../../core/services/stripe_payment_services/service/strip_payment_service.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);

  makeStripePayment({required int amount}) async {
    try {
      emit(MakeStripePaymentLoadingState());
    await  StripPaymentService.makePayment(
          paymentIntentInputModel: PaymentIntentInputModel(
              amount: amount.toString(), currency: 'USD'));
      emit(MakeStripePaymentSuccessState());
    } catch (error) {
      emit(MakeStripePaymentErrorState());
      debugPrint(error.toString());
    }
  }
  confirmPaid(String dateTime)async{
    await FireBaseHelper.docRefForAppointmentToFireStore(dateTime, AppointmentModel()).update({'is_paid':true});

  }
}
