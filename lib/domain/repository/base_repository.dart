import 'package:either_dart/either.dart';
import 'package:news/data/network/failure.dart';
import 'package:news/domain/models/article.dart';
import 'package:news/domain/models/source.dart';

abstract class BaseRepository {
  Future<Either<Failure, List<Article>>> getEveryThingNews(String q);
  Future<Either<Failure, List<Article>>> getHeadlineNews(String source);
  Future<Either<Failure, List<Source>>> getNewsSources();
}
