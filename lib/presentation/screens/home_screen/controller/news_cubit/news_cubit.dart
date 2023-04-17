import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/domain/models/article.dart';
import 'package:news/domain/usecases/everything_news_usecase.dart';
import 'package:news/domain/usecases/headline_news_usecase.dart';
import 'package:news/domain/usecases/source_news_usecase.dart';
import 'package:news/presentation/src/strings.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._usecase, this._headLineNewsUseCase, this._sourceNewsUseCase)
      : super(NewsInitial());

  List<Article> sportArticles = [];
  List<Article> bussinessArticles = [];
  List<Article> scienceArticles = [];
  List<Article> topHeadlineArticles = [];
  List<Article> searchArticles = [];
  final NewsEveryThingUseCase _usecase;
  final HeadLineNewsUseCase _headLineNewsUseCase;
  final SourceNewsUseCase _sourceNewsUseCase;

  Future<void> getSportsNewsData() async {
    if (sportArticles.isNotEmpty) {
      emit(NewsSportSucsess(articles: sportArticles));
      return;
    }
    emit(NewsSportLoading());
    await _usecase.execute(AppStrings.sports).fold(
      (failure) {
        emit(NewsSportFailure(failure.message));
      },
      (articles) {
        sportArticles = articles;
        emit(NewsSportSucsess(articles: sportArticles));
      },
    );
  }

  Future<void> getBussinessNewsData() async {
    if (bussinessArticles.isNotEmpty) {
      emit(NewsBussinessSucsess(articles: bussinessArticles));
      return;
    }
    emit(NewsBussinnessLoading());
    await _usecase.execute(AppStrings.money).fold(
      (failure) {
        emit(NewsBussinessFailure(failure.message));
      },
      (articles) {
        bussinessArticles = articles;
        emit(NewsBussinessSucsess(articles: bussinessArticles));
      },
    );
  }

  Future<void> getScienceNewsData() async {
    if (scienceArticles.isNotEmpty) {
      emit(NewsScienceSucsess(articles: scienceArticles));
      return;
    }
    emit(NewsScienceLoading());
    await _usecase.execute(AppStrings.science).fold(
      (failure) {
        emit(NewsScienceFailure(failure.message));
      },
      (articles) {
        scienceArticles = articles;
        emit(NewsScienceSucsess(articles: scienceArticles));
      },
    );
  }

  Future<void> getTopHeadlineNewsData() async {
    if (topHeadlineArticles.isNotEmpty) {
      emit(NewsTopHeadlineSucsess(articles: topHeadlineArticles));
      return;
    }
    emit(NewsTopHeadlineLoading());
    await _headLineNewsUseCase.execute(AppStrings.bbcNews).fold(
      (failure) {
        emit(NewsTopHeadlineFailure(failure.message));
      },
      (articles) {
        topHeadlineArticles = articles;
        emit(NewsTopHeadlineSucsess(articles: topHeadlineArticles));
      },
    );
  }

  Future<void> getSearchNewsData(String q) async {
    emit(NewsSearchLoading());
    await _usecase.execute(q).fold(
      (failure) {
        emit(NewsSearchFailure(failure.message));
      },
      (articles) {
        searchArticles = articles;
        emit(NewsSearchSucsess(articles: searchArticles));
      },
    );
  }
}
