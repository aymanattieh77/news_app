// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news/presentation/widgets/article_item_card.dart';

import '../../domain/models/article.dart';

class BuildListViewArticles extends StatelessWidget {
  final List<Article> articles;
  const BuildListViewArticles({
    Key? key,
    required this.articles,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final fillterdArticles =
        articles.where((article) => article.author.isNotEmpty).toList();
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: fillterdArticles.length,
      itemBuilder: (ctx, index) {
        return ArticleItemCard(
          article: fillterdArticles[index],
        );
      },
    );
  }
}
