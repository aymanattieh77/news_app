part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsSportLoading extends NewsState {}

class NewsSportSucsess extends NewsState {
  final List<Article> articles;
  NewsSportSucsess({
    required this.articles,
  });
}

class NewsSportFailure extends NewsState {
  final String err;
  NewsSportFailure(this.err);
}

class NewsBussinnessLoading extends NewsState {}

class NewsBussinessSucsess extends NewsState {
  final List<Article> articles;
  NewsBussinessSucsess({
    required this.articles,
  });
}

class NewsBussinessFailure extends NewsState {
  final String err;
  NewsBussinessFailure(this.err);
}

class NewsScienceLoading extends NewsState {}

class NewsScienceSucsess extends NewsState {
  final List<Article> articles;
  NewsScienceSucsess({
    required this.articles,
  });
}

class NewsScienceFailure extends NewsState {
  final String err;
  NewsScienceFailure(this.err);
}

class NewsTopHeadlineLoading extends NewsState {}

class NewsTopHeadlineSucsess extends NewsState {
  final List<Article> articles;
  NewsTopHeadlineSucsess({
    required this.articles,
  });
}

class NewsTopHeadlineFailure extends NewsState {
  final String err;
  NewsTopHeadlineFailure(this.err);
}

class NewsSearchLoading extends NewsState {}

class NewsSearchSucsess extends NewsState {
  final List<Article> articles;
  NewsSearchSucsess({
    required this.articles,
  });
}

class NewsSearchFailure extends NewsState {
  final String err;
  NewsSearchFailure(this.err);
}

class NewsStartSearch extends NewsState {}

class NewsStopSearch extends NewsState {}
