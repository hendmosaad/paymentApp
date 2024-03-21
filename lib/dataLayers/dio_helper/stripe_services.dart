import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:payment/core/failure/Failure.dart';
import 'package:payment/dataLayers/dio_helper/end_points.dart';
import 'package:payment/dataLayers/models/PaymentIntentModel.dart';
import 'package:payment/dataLayers/models/PaymentInputmodel.dart';
import 'package:payment/dataLayers/dio_helper/dioHelper.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices{
  static Future <Either<Failure,PaymentIntentModel>>createPaymentIntent(
      {required PaymentInputModel paymentInputModel})async{
    try{
      final response =await  DioHelper.postData(url: EndPoints.createPaymentIntent, data: paymentInputModel.toJson());

      try{
        return Right(PaymentIntentModel.fromJson(response.data));
      }catch(onError){
        print(onError);
        print('parsing PaymentIntentModel error ');
        return left(ServerError(errMessage: onError.toString()));

      }
    }catch(onError){
      return left(ServerError(errMessage: onError.toString()));
    };


  }
 //  static Future<PaymentIntentModel> createPaymentIntent(PaymentInputModel paymentInputModel)async{
 // final response =await  DioHelper.postData(url: EndPoints.createPaymentIntent, data: paymentInputModel.toJson())
 //     .catchError((onError){
 //       print(onError);
 //   print('post createPaymentIntent error ');
 //
 // });
 // try{
 //   return PaymentIntentModel.fromJson(response.data);
 // }catch(error){
 //   print(error);
 //   print('parsing PaymentIntentModel error ');
 //   return PaymentIntentModel();
 //
 // };
 //  }
  static Future <Either<Failure,void>>initialisePaymentSheet({required String paymentIntentClientSecret})async{
try{
  await Stripe.instance.initPaymentSheet(
    paymentSheetParameters:SetupPaymentSheetParameters(
        paymentIntentClientSecret:paymentIntentClientSecret ,
        appearance: PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: Colors.green,
              background: Colors.white,

            )
        ),
        merchantDisplayName: 'hend',

    ) ,
  );
  print('Stripe Service init sheet method successful');
  return Right(null);
}
    catch(onError){
      print('Stripe Service init sheet method error');
      print(onError);
      return left(ServerError(errMessage: onError.toString()));
    };

  }
  static Future<Either<Failure,void>> presentPaymentSheet()async{
   try {
     await Stripe.instance.presentPaymentSheet();
    return Right(null);
   }catch (onError){
     return left(ServerError(errMessage: onError.toString()));
   }
  }


  // static Future createPayment({required PaymentInputModel paymentInputModel})async{
  //   var paymentIntentModel=await createPaymentIntent(paymentInputModel);
  //   await initialisePaymentSheet(paymentInputModel: paymentInputModel,
  //       paymentIntentClientSecret: paymentIntentModel.fold((l) => null, (r) => null).clientSecret!);
  //   await presentPaymentSheet();
  //
  //
  // }
}