import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:responsive/core/config/dio_config.dart';
import 'package:responsive/core/constants/base_urls.dart';
import 'package:responsive/data/model/user_model.dart';

class UserServce {
  static Future getUser() async {
    dynamic response;
    try {
      Response res = await DioConfig.createRequest().get(BaseUrl.baseUrl);
      if (res.statusCode == HttpStatus.ok) {
        print(res.data);
        response = (res.data as List).map((e) => UserModel.fromJson(e));
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        response = "Server error";
      } else {
        response = "No internet connection";
      }
    }
    return response;
  }
}
