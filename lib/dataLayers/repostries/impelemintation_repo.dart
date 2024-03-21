// import 'dart:developer';
//
// import 'package:dartz/dartz.dart';
// import 'package:payment/core/failure/Failure.dart';
// import 'package:payment/dataLayers/dio_helper/stripe_services.dart';
// import 'package:payment/dataLayers/models/PaymentIntentModel.dart';
// import 'package:payment/dataLayers/repostries/base_repository.dart';
//
// class impelRepository extends BaseRepository {
//   StripeServices stripeServices = StripeServices();
//
//   @override
//   Future<Either<Failure, void>> createPayment(
//       PaymentInputModel paymentInputModel) async {
//     try {
//       await StripeServices.createPayment(paymentInputModel: paymentInputModel);
//       return Right(null);
//     } catch (error) {
//       return left(ServerError(errMessage: error.toString()));
//     }
//   }
// }
