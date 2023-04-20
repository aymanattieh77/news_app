import 'package:news/data/network/failure.dart';
import 'package:either_dart/src/either.dart';
import 'package:news/domain/models/article.dart';
import 'package:news/domain/repository/base_repository.dart';
import 'package:news/domain/usecases/base_usecase.dart';

class HeadLineNewsUseCase implements BaseUseCase<String, List<Article>> {
  final BaseRepository _baseRepository;
  HeadLineNewsUseCase(this._baseRepository);
  @override
  Future<Either<Failure, List<Article>>> execute(String input) async {
    return await _baseRepository.getHeadlineNews(input);
  }
}
