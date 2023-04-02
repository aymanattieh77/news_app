import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/controller/cubits/news_cubit/news_cubit.dart';

import 'package:news/model/models/article.dart';

import 'package:news/view/widgets/news_error_widgets.dart';
import 'package:news/view/widgets/article_item_card.dart';

class TopHeadLinePage extends StatelessWidget {
  const TopHeadLinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsTopHeadlineLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsTopHeadlineSucsess) {
          final news = state.articles;

          return _buildTopHeadLineArticleItem(news, context);
        } else if (state is NewsTopHeadlineFailure) {
          return showErrorContainer(context, state.err);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildTopHeadLineArticleItem(
      List<Article> articles, BuildContext context) {
    final filterdArticles =
        articles.where((article) => article.author != null).toList();
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: articles.length - 1,
      itemBuilder: (ctx, index) {
        return ArticleItemCard(
          article: filterdArticles[index],
        );
      },
    );
  }
}
