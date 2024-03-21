import 'package:dartz/dartz.dart';
import 'package:payment/core/failure/Failure.dart';
import 'package:payment/dataLayers/models/PaymentInputmodel.dart';

abstract class BaseRepository{
  Future <Either<Failure,void>> createPayment( PaymentInputModel paymentInputModel);

}