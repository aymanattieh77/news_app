import 'package:news/data/data_source/remote_data_source.dart';
import 'package:news/data/mappers/mapper.dart';
import 'package:news/domain/models/source.dart';
import 'package:news/domain/models/article.dart';
import 'package:news/data/network/failure.dart';
import 'package:either_dart/src/either.dart';
import 'package:news/domain/repository/base_repository.dart';
import 'package:news/presentation/src/strings.dart';

class Repository extends BaseRepository {
  final BaseRemoteDataSource _baseRemoteDataSource;

  Repository(this._baseRemoteDataSource);
  @override
  Future<Either<Failure, List<Article>>> getEveryThingNews(String q) async {
    try {
      final response = await _baseRemoteDataSource.getEveryThingNews(q);
      if (response.status == AppStrings.ok) {
        final articles = response.articles!
            .map((articleResponse) => articleResponse.toDomain())
            .toList();
        return Right(articles);
      } else {
        return Left(Failure(code: 1, message: response.message!));
      }
    } catch (e) {
      return Left(Failure(code: 1, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Article>>> getHeadlineNews(String source) async {
    try {
      final response = await _baseRemoteDataSource.getHeadlineNews(source);
      if (response.status == AppStrings.ok) {
        final articles = response.articles!
            .map((articleResponse) => articleResponse.toDomain())
            .toList();
        return Right(articles);
      } else {
        return Left(Failure(code: 1, message: response.message!));
      }
    } catch (e) {
      return Left(Failure(code: 1, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Source>>> getNewsSources() async {
    try {
      final response = await _baseRemoteDataSource.getNewsSources();
      if (response.status == AppStrings.ok) {
        final sources = response.sources!
            .map((sourceResponse) => sourceResponse.toDomain())
            .toList();
        return Right(sources);
      } else {
        return Left(Failure(code: 1, message: response.message!));
      }
    } catch (e) {
      return Left(Failure(code: 1, message: e.toString()));
    }
  }
}
