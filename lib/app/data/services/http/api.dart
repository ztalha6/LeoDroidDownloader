import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:teamx/app/data/constants/api_constants.dart';
import 'package:teamx/app/data/services/http/dio_interceptor.dart';

class Api {
  final tokenDio = Dio(BaseOptions(
    baseUrl: ApiContants.baseUrl,
  ));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  Dio createDio() {
    var dio = Dio(BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'locale': Get.locale?.languageCode
      },
      baseUrl: ApiContants.baseUrl,
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    dio.interceptors.addAll({
      DioInterceptor(dio),
    });
    return dio;
  }
}
