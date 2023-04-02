import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:news/controller/cubits/bottom_bar_cubit/navigation_bar_cubit.dart';
import 'package:news/controller/cubits/news_cubit/news_cubit.dart';
import 'package:news/controller/cubits/simple_bloc_observer.dart';
import 'package:news/controller/cubits/theme_cubit.dart';

import 'package:news/view/screens/home_screen/home_screen.dart';

import 'view/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBLocObserver();
  final pref = await SharedPreferences.getInstance();
  bool isDark = pref.getBool('isDark') ?? false;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => NavigationBarCubit()),
        BlocProvider(create: (ctx) => NewsCubit()),
        BlocProvider(
          create: (ctx) =>
              ThemeCubit(isDark ? ThemeMode.dark : ThemeMode.light),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return MaterialApp(
          title: 'news app',
          theme: myTheme,
          darkTheme: darkTheme,
          themeMode: state,
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        );
      },
    );
  }
}
