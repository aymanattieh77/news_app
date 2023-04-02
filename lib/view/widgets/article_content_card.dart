import 'package:flutter/material.dart';

import 'package:news/model/models/article.dart';

import 'package:news/view/screens/web_view_Screen/web_view_screen.dart';

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
              'Description',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 21, color: textColor),
            ),
            const SizedBox(height: 7),
            Text(
              article.description ?? "",
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 7),
            Text(
              'Content',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 21, color: textColor),
            ),
            const SizedBox(height: 7),
            Text(article.content ?? "", style: TextStyle(color: textColor)),
            Text(
              'Source url',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 21, color: textColor),
            ),
            const SizedBox(height: 7),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => WebViewScreen(
                            url: article.url!, source: article.source!.name!)));
              },
              child: Text("Visit Site", style: TextStyle(color: textColor)),
            ),
            const SizedBox(height: 7),
          ],
        ),
      ),
    );
  }
}
