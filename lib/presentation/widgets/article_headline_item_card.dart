import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:news/domain/models/article.dart';
import 'package:news/presentation/src/values.dart';

class ArticleHeadLineItemCard extends StatelessWidget {
  const ArticleHeadLineItemCard({
    super.key,
    required this.article,
  });
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSizes.s15,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppSizes.s30),
                bottomRight: Radius.circular(AppSizes.s30)),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: AppHeights.h300,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSizes.s30),
                    bottomRight: Radius.circular(AppSizes.s30))),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 7),
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        article.source.name,
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        Jiffy.parse(article.publishedAt).yMMMMEEEEdjm,
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
