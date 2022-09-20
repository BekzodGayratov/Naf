import 'package:dio/dio.dart';

class DioConfig {
  static Dio createRequest() {
    var dio = Dio(BaseOptions(
      receiveDataWhenStatusError: true,
    ));
    
    // TIME OUT
    dio.options.connectTimeout = 55 * 1000;
    dio.options.receiveTimeout = 55 * 1000;
    dio.options.sendTimeout = 55 * 1000;

    return dio;
  }
}