import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:news/model/models/article.dart';

import 'package:news/view/screens/news_detail_screen.dart/news_detail_screen.dart';

class ArticleItemCard extends StatelessWidget {
  const ArticleItemCard({
    super.key,
    required this.article,
  });
  final Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => NewsDetailScreen(
              article: article,
            ),
          ),
        );
      },
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 15,
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 130,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: article.urlToImage ?? 'null',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 130,
                width: 130,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      article.author ?? "null",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Theme.of(context).splashColor),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      article.title ?? 'null',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Theme.of(context).splashColor),
                    ),
                    const SizedBox(height: 2),
                    const Spacer(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            article.source!.name ?? 'null',
                            style: TextStyle(
                                fontSize: 10,
                                color: Theme.of(context).splashColor),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            Jiffy.parse(article.publishedAt ?? '2000').yMMMEdjm,
                            style: TextStyle(
                                fontSize: 10,
                                color: Theme.of(context).splashColor),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
