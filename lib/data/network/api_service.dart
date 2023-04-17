import 'package:dio/dio.dart';
import 'package:news/app/constants.dart';
import 'package:news/data/responses/responses.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: AppConstants.newsBaseUrl)
abstract class APIService {
  factory APIService(Dio dio, {String baseUrl}) = _APIService;

  @GET('/v2/everything')
  Future<NewsResponse> getEveryThingNews(@Query('q') String q,
      [@Query('apiKey') String apiKey = AppConstants.newsApiKey]);

  @GET('/v2/top-headlines')
  Future<NewsResponse> getHeadlineNews(@Query('sources') String source,
      [@Query('apiKey') String apiKey = AppConstants.newsApiKey]);

  @GET('/v2/top-headlines/sources')
  Future<NewsResponse> getNewsSources(
      [@Query('apiKey') String apiKey = AppConstants.newsApiKey]);
}
