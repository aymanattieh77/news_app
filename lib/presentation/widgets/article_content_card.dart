import 'package:flutter/material.dart';

import 'package:news/domain/models/article.dart';

import 'package:news/presentation/screens/web_view_Screen/web_view_screen.dart';
import 'package:news/presentation/src/strings.dart';
import 'package:news/presentation/src/values.dart';

class ArticleContentCard extends StatelessWidget {
  const ArticleContentCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).splashColor;
    return Card(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 7),
            Text(
              AppStrings.description,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 21, color: textColor),
            ),
            const SizedBox(height: 7),
            Text(
              article.description,
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 7),
            Text(
              AppStrings.content,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 21, color: textColor),
            ),
            const SizedBox(height: 7),
            Text(article.content, style: TextStyle(color: textColor)),
            Text(
              AppStrings.sourceUrl,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 21, color: textColor),
            ),
            const SizedBox(height: AppSizes.s8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => WebViewScreen(
                            url: article.url, source: article.source.name)));
              },
              child: Text(AppStrings.visitSite,
                  style: TextStyle(color: textColor)),
            ),
            const SizedBox(height: AppSizes.s8),
          ],
        ),
      ),
    );
  }
}
