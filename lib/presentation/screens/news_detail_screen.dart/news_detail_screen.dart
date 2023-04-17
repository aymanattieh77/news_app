import 'package:flutter/material.dart';

import 'package:news/model/models/article.dart';

import 'package:news/presentation/widgets/article_headline_item_card.dart';
import 'package:news/presentation/widgets/article_content_card.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.source!.name ?? ""),
      ),
      body: ListView(
        children: [
          ArticleHeadLineItemCard(article: article),
          ArticleContentCard(article: article)
        ],
      ),
    );
  }
}
