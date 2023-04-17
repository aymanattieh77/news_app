import 'package:news/data/network/api_service.dart';
import 'package:news/data/responses/responses.dart';

abstract class BaseRemoteDataSource {
  Future<NewsResponse> getEveryThingNews(String q);
  Future<NewsResponse> getHeadlineNews(String source);
  Future<NewsResponse> getNewsSources();
}

class RemoteDataSource implements BaseRemoteDataSource {
  final APIService _apiService;
  RemoteDataSource(this._apiService);
  @override
  Future<NewsResponse> getEveryThingNews(String q) async {
    return await _apiService.getEveryThingNews(q);
  }

  @override
  Future<NewsResponse> getHeadlineNews(String source) async {
    return await _apiService.getHeadlineNews(source);
  }

  @override
  Future<NewsResponse> getNewsSources() async {
    return await _apiService.getNewsSources();
  }
}
