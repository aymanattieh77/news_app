import 'package:get_it/get_it.dart';
import 'package:news/data/data_source/remote_data_source.dart';
import 'package:news/data/network/api_service.dart';
import 'package:news/data/network/dio_factory.dart';

final getIt = GetIt.instance;

setupAppModule() async {
  getIt.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await getIt<DioFactory>().getDio();

  getIt.registerLazySingleton<APIService>(() => APIService(dio));
  getIt.registerLazySingleton<BaseRemoteDataSource>(
      () => RemoteDataSource(getIt()));
}
