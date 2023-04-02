import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/model/data/news_repository.dart';

import 'package:news/model/models/article.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  List<Article> sportArticles = [];
  List<Article> bussinessArticles = [];
  List<Article> scienceArticles = [];
  List<Article> topHeadlineArticles = [];
  List<Article> searchArticles = [];

  Future<void> getSportNewsData(String query) async {
    if (sportArticles.isNotEmpty) {
      emit(NewsSportSucsess(articles: sportArticles));
      return;
    }
    emit(NewsSportLoading());
    try {
      final data = await NewsRepositorys.getSportNewsData(query);
      sportArticles = data.map((json) {
        return Article.fromJson(json);
      }).toList();

      emit(NewsSportSucsess(articles: sportArticles));
    } catch (e) {
      emit(NewsSportFailure(e.toString()));
    }
  }

  Future<void> getBussinessNewsData(String q) async {
    if (bussinessArticles.isNotEmpty) {
      emit(NewsBussinessSucsess(articles: bussinessArticles));
      return;
    }
    emit(NewsBussinnessLoading());
    try {
      final data = await NewsRepositorys.getBussinessNewsData(q);
      bussinessArticles = data.map((json) {
        return Article.fromJson(json);
      }).toList();

      emit(NewsBussinessSucsess(articles: bussinessArticles));
    } catch (e) {
      emit(NewsBussinessFailure(e.toString()));
    }
  }

  Future<void> getScienceNewsData(String q) async {
    if (scienceArticles.isNotEmpty) {
      emit(NewsScienceSucsess(articles: scienceArticles));
      return;
    }
    emit(NewsScienceLoading());
    try {
      final data = await NewsRepositorys.getScienceNewsData(q);
      scienceArticles = data.map((json) {
        return Article.fromJson(json);
      }).toList();

      emit(NewsScienceSucsess(articles: scienceArticles));
    } catch (e) {
      emit(NewsScienceFailure(e.toString()));
    }
  }

  Future<void> getTopHeadlineNewsData(String q) async {
    if (topHeadlineArticles.isNotEmpty) {
      emit(NewsTopHeadlineSucsess(articles: topHeadlineArticles));
      return;
    }
    emit(NewsTopHeadlineLoading());
    try {
      final data = await NewsRepositorys.getTopHeadlinesNewsData(q);
      topHeadlineArticles = data.map((json) {
        return Article.fromJson(json);
      }).toList();

      emit(NewsTopHeadlineSucsess(articles: topHeadlineArticles));
    } catch (e) {
      emit(NewsTopHeadlineFailure(e.toString()));
    }
  }

  Future<void> getSearchNewsData(String q) async {
    if (searchArticles.isNotEmpty) {
      emit(NewsSearchSucsess(articles: searchArticles));
      return;
    }
    emit(NewsSearchLoading());
    try {
      final data = await NewsRepositorys.getSearchNewsData(q);
      searchArticles = data.map((json) {
        return Article.fromJson(json);
      }).toList();

      emit(NewsSearchSucsess(articles: searchArticles));
    } catch (e) {
      emit(NewsSearchFailure(e.toString()));
    }
  }
}
