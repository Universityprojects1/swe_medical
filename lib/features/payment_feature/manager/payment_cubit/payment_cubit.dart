import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:swe_medical/core/services/stripe_payment_services/models/payment_intent_input_model.dart';

import '../../../../core/services/stripe_payment_services/service/strip_payment_service.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);


  createPayment(){
    StripPaymentService.makePayment(paymentIntentInputModel: PaymentIntentInputModel(amount: '100', currency: 'USD'));


  }


}
