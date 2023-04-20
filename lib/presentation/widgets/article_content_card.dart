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
    final textTheme = Theme.of(context).textTheme;
    return Card(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppHeights.h8),
            Text(AppStrings.description, style: textTheme.bodyMedium),
            const SizedBox(height: AppHeights.h8),
            Text(
              article.description,
              style: textTheme.bodySmall,
            ),
            const SizedBox(height: AppHeights.h8),
            Text(AppStrings.content, style: textTheme.bodyLarge),
            const SizedBox(height: AppHeights.h8),
            Text(article.content, style: textTheme.bodySmall),
            Text(AppStrings.sourceUrl, style: textTheme.bodyLarge),
            const SizedBox(height: AppSizes.s8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => WebViewScreen(
                            url: article.url, source: article.source.name)));
              },
              child: Text(AppStrings.visitSite, style: textTheme.bodySmall),
            ),
            const SizedBox(height: AppSizes.s8),
          ],
        ),
      ),
    );
  }
}
