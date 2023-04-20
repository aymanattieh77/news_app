import 'package:news/data/network/failure.dart';
import 'package:either_dart/src/either.dart';

import 'package:news/domain/models/source.dart';
import 'package:news/domain/repository/base_repository.dart';
import 'package:news/domain/usecases/base_usecase.dart';

class SourceNewsUseCase implements BaseUseCase<int, List<Source>> {
  final BaseRepository _baseRepository;
  SourceNewsUseCase(this._baseRepository);
  @override
  Future<Either<Failure, List<Source>>> execute(int _) async {
    return await _baseRepository.getNewsSources();
  }
}
