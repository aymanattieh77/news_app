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
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (ctx, index) {
        return ArticleItemCard(
          article: articles[index],
        );
      },
    );
  }
}
