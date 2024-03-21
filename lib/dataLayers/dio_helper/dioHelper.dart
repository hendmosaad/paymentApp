import 'package:dio/dio.dart';
import 'package:payment/core/utils/Conestances.dart';

class DioHelper{
  static Dio  dio=Dio();

  static Future<Response> postData({
    required String url,
    Map<String,dynamic>?queryParameters,
    required Map<String,dynamic>?data
  })async{
    dio!.options.headers={
      'Content-Type':'application/json',

      'Authorization':'Beater ${Conestances.secretKey}',
    };
    return  dio!.post(url,queryParameters: queryParameters,data: data);
  }
}