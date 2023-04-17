import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/controller/cubits/news_cubit/news_cubit.dart';
import 'package:news/model/models/article.dart';

import 'package:news/presentation/widgets/news_error_widgets.dart';
import 'package:news/presentation/widgets/article_item_card.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsSportLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsSportSucsess) {
          final news = state.articles;

          return _buildSportArticleItem(news);
        } else if (state is NewsSportFailure) {
          return showErrorContainer(context, state.err);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildSportArticleItem(List<Article> articles) {
    final filterdArticles =
        articles.where((article) => article.author != null).toList();
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (ctx, index) {
        return ArticleItemCard(
          article: filterdArticles[index],
        );
      },
    );
  }
}
