import 'package:news/app/extensions.dart';
import 'package:news/data/responses/responses.dart';
import 'package:news/model/models/article.dart';
import 'package:news/model/models/source.dart';
import 'package:news/presentation/src/resources.dart';

extension ArticleResponseExtension on ArticleResponse? {
  Article toDomain() {
    return Article(
      source: this!.source.toDomain(),
      author: this?.author.orEmpty() ?? AppStrings.empty,
      title: this?.title.orEmpty() ?? AppStrings.empty,
      description: this?.description.orEmpty() ?? AppStrings.empty,
      url: this?.url.orEmpty() ?? AppStrings.empty,
      urlToImage: this?.urlToImage.orEmpty() ?? AppStrings.empty,
      publishedAt: this?.publishedAt.orEmpty() ?? AppStrings.empty,
      content: this?.content.orEmpty() ?? AppStrings.empty,
    );
  }
}

extension SourceResponseExtension on SourceResponse? {
  Source toDomain() {
    return Source(
      id: this?.id.orEmpty() ?? AppStrings.empty,
      name: this?.name.orEmpty() ?? AppStrings.empty,
      description: this?.description.orEmpty() ?? AppStrings.empty,
      url: this?.url.orEmpty() ?? AppStrings.empty,
      category: this?.category.orEmpty() ?? AppStrings.empty,
      language: this?.language.orEmpty() ?? AppStrings.empty,
      country: this?.country.orEmpty() ?? AppStrings.empty,
    );
  }
}
