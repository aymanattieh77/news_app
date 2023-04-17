import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:news/domain/models/article.dart';

import 'package:news/presentation/screens/news_detail_screen.dart/news_detail_screen.dart';
import 'package:news/presentation/src/fonts.dart';
import 'package:news/presentation/src/values.dart';

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
        elevation: AppSizes.s15,
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p5),
          height: AppHeights.h130,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: article.urlToImage,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: AppHeights.h130,
                width: AppWidths.w130,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      article.author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Theme.of(context).splashColor),
                    ),
                    const SizedBox(height: AppHeights.h8),
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Theme.of(context).splashColor),
                    ),
                    const SizedBox(height: AppHeights.h5),
                    const Spacer(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            article.source.name,
                            style: TextStyle(
                                fontSize: FontSizes.f10,
                                color: Theme.of(context).splashColor),
                          ),
                          const SizedBox(width: AppWidths.w8),
                          Text(
                            Jiffy.parse(article.publishedAt).yMMMEdjm,
                            style: TextStyle(
                                fontSize: FontSizes.f10,
                                color: Theme.of(context).splashColor),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppHeights.h5),
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
