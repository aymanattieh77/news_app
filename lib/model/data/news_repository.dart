import 'package:news/controller/services/api_exception.dart';
import 'package:news/controller/services/api_service.dart';

class NewsRepositorys {
  static Future<List> getSportNewsData(String query) async {
    final result = await APIService.inctance.getNewsEverythingData(query);

    if (result is APISucsess) {
      return result.sucsses as List;
    } else if (result is APIFailure) {
      throw Exception(result.error);
    }
    return [];
  }

  static Future<List> getBussinessNewsData(String query) async {
    final result = await APIService.inctance.getNewsEverythingData(query);

    if (result is APISucsess) {
      return result.sucsses as List;
    } else if (result is APIFailure) {
      throw Exception(result.error);
    }
    return [];
  }

  static Future<List> getScienceNewsData(String query) async {
    final result = await APIService.inctance.getNewsEverythingData(query);

    if (result is APISucsess) {
      return result.sucsses as List;
    } else if (result is APIFailure) {
      throw Exception(result.error);
    }
    return [];
  }

  static Future<List> getSearchNewsData(String q) async {
    final result = await APIService.inctance.getNewsEverythingData(q);

    if (result is APISucsess) {
      return result.sucsses as List;
    } else if (result is APIFailure) {
      throw Exception(result.error);
    }
    return [];
  }

  static Future<List> getTopHeadlinesNewsData(String query) async {
    final result = await APIService.inctance.getTopHeadlinesData(query);

    if (result is APISucsess) {
      return result.sucsses as List;
    } else if (result is APIFailure) {
      throw Exception(result.error);
    }
    return [];
  }
}
