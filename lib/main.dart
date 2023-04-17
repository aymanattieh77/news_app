import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app/app.dart';
import 'package:news/app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:news/app/simple_bloc_observer.dart';
import 'package:news/app/theme_cubit.dart';

import 'presentation/screens/home_screen/controller/bottom_bar_cubit/navigation_bar_cubit.dart';
import 'presentation/screens/home_screen/controller/news_cubit/news_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBLocObserver();
  final pref = await SharedPreferences.getInstance();
  bool isDark = pref.getBool('isDark') ?? false;
  await setupAppModule();
  setupNewsData();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => NavigationBarCubit()),
        BlocProvider(
          create: (ctx) => getIt<NewsCubit>(),
        ),
        BlocProvider(
          create: (ctx) =>
              ThemeCubit(isDark ? ThemeMode.dark : ThemeMode.light),
        ),
      ],
      child: NewsApp(),
    ),
  );
}
