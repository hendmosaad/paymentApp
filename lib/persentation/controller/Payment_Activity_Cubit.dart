import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/failure/Failure.dart';
import 'package:payment/dataLayers/dio_helper/stripe_services.dart';
import 'package:payment/dataLayers/models/PaymentInputmodel.dart';
import 'package:payment/dataLayers/models/PaymentIntentModel.dart';
import 'package:payment/persentation/controller/Payment_Activity_State.dart';

class PaymentActivityCubit extends Cubit<PaymentActivityState>{
  PaymentActivityCubit() : super(InitialState());
  static PaymentActivityCubit get(context) => BlocProvider.of(context);
  int isActiveIndex=0;
  bool isLoading=false;
  Future changeIsActiveIndex(index)async{
    isActiveIndex=index;
    emit(InitialState());
  }

Future  createPayment()async{
    emit(IntentLoading());
 var response1= await StripeServices.createPaymentIntent(paymentInputModel: PaymentInputModel(amount: 100, currency: 'usd'));
  response1.fold((l) {
    emit(IntentError());
    print( l.errMessage);
  }, (r) async{
    emit(IntentSuccess());
    emit(InitSheetLoading());
    var response2= await StripeServices.initialisePaymentSheet(paymentIntentClientSecret: r.clientSecret!);
    response2.fold((l) {
      emit(InitSheetError());
      print( l.errMessage);

    }, (r) async{
      emit(InitSheetSuccess());
      emit(PresentSheetLoading());
      var response3= await StripeServices.presentPaymentSheet();
     response3.fold((l){
       emit(PresentSheetError());
       print( l.errMessage);

     }, (r) {
       emit(PresentSheetSuccess());
     });
    });
  });
  }

}