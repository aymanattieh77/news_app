import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/controller/cubits/news_cubit/news_cubit.dart';

import 'package:news/model/models/article.dart';

import 'package:news/presentation/widgets/article_item_card.dart';
import 'package:news/presentation/widgets/news_error_widgets.dart';

class SciencePage extends StatelessWidget {
  const SciencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsScienceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsScienceSucsess) {
          final news = state.articles;

          return _buildScienceArticleItem(news, context);
        } else if (state is NewsScienceFailure) {
          return showErrorContainer(context, state.err);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildScienceArticleItem(
      List<Article> articles, BuildContext context) {
    final filterdArticles =
        articles.where((article) => article.author != null).toList();
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (ctx, index) {
        return ArticleItemCard(
          article: filterdArticles[index],
        );
      },
    );
  }
}
