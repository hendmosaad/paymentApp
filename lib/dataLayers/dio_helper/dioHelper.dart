import 'package:dio/dio.dart';
import 'package:payment/core/utils/Conestances.dart';

class DioHelper{
  static Dio?  dio;
  static void initDio()
  {
    dio=Dio();
  }
  static Future<Response> postData({
    required String url,
    Map<String,dynamic>?queryParameters,
    required Map<String,dynamic>?data
  })async{
    dio!.options.headers={
      'Content-Type':'application/x-www-form-urlencoded',
      'Authorization':'Bearer ${Conestances.secretKey}',
    };
    return await dio!.post(url,data: data);
  }
}