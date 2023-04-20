import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news/app/app_prefs.dart';
import 'package:news/app/theme_cubit.dart';
import 'package:news/data/data_source/remote_data_source.dart';
import 'package:news/data/network/api_service.dart';
import 'package:news/data/network/dio_factory.dart';
import 'package:news/data/repository/repository.dart';
import 'package:news/domain/repository/base_repository.dart';
import 'package:news/domain/usecases/everything_news_usecase.dart';
import 'package:news/domain/usecases/headline_news_usecase.dart';
import 'package:news/domain/usecases/source_news_usecase.dart';
import 'package:news/presentation/screens/home_screen/controller/news_cubit/news_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupAppModule() async {
  getIt.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await getIt<DioFactory>().getDio();

  getIt.registerLazySingleton<APIService>(() => APIService(dio));
  getIt.registerLazySingleton<BaseRemoteDataSource>(
      () => RemoteDataSource(getIt()));
  getIt.registerLazySingleton<BaseRepository>(() => Repository(getIt()));
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(prefs));
}

void setupNewsData() {
  getIt.registerFactory<NewsEveryThingUseCase>(
      () => NewsEveryThingUseCase(getIt()));
  getIt
      .registerFactory<HeadLineNewsUseCase>(() => HeadLineNewsUseCase(getIt()));
  getIt.registerFactory<SourceNewsUseCase>(() => SourceNewsUseCase(getIt()));
  getIt.registerFactory<NewsCubit>(() => NewsCubit(getIt(), getIt(), getIt()));
}

void setupAppTheme() {
  // theme dark and light mode
  bool isDark = getIt<AppPreferences>().isDarkMode();
  final mode = isDark ? ThemeMode.dark : ThemeMode.light;
  getIt.registerFactory<ThemeCubit>(() => ThemeCubit(mode, getIt()));
}
