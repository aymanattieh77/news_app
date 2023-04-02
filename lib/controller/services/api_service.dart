import 'package:dio/dio.dart';

import 'package:news/constants.dart';

import 'package:news/controller/services/api_exception.dart';

class APIService {
  Dio? _dio;
  static final APIService _apiService = APIService._internal();

  static APIService get inctance => _apiService;

  APIService._internal() {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: newsBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    _dio = Dio(baseOptions);
  }

  Future<APIResults> getNewsEverythingData(String query) async {
    try {
      final response = await _dio!.get(
        newsEverythingUrl,
        queryParameters: {'apiKey': newsApiKey, 'q': query},
      );

      return APISucsess(sucsses: response.data['articles'] as List);
    } catch (e) {
      return APIFailure(error: e.toString());
    }
  }

  Future<APIResults> getTopHeadlinesData(String country) async {
    try {
      final response = await _dio!.get(
        newsTopHeadlinesUrl,
        queryParameters: {'apiKey': newsApiKey, 'country': country},
      );
      return APISucsess(sucsses: response.data['articles'] as List);
    } catch (e) {
      return APIFailure(error: e.toString());
    }
  }
}
