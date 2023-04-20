import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    final Map<String, dynamic> header = {
      accept: applicationJson,
      contentType: applicationJson
    };

    final options = BaseOptions(
      connectTimeout: const Duration(milliseconds: AppConstants.apiTimeOut),
      receiveTimeout: const Duration(milliseconds: AppConstants.apiTimeOut),
      sendTimeout: const Duration(milliseconds: AppConstants.apiTimeOut),
      receiveDataWhenStatusError: true,
      headers: header,
    );

    dio.options = options;

    // if (!kReleaseMode) {
    //   dio.interceptors
    //       .add(PrettyDioLogger(requestBody: true, requestHeader: true));
    // }

    return dio;
  }
}
