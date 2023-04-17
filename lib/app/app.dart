import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/app/theme_cubit.dart';
import 'package:news/presentation/screens/home_screen/view/home_view.dart';
import 'package:news/presentation/src/strings.dart';
import 'package:news/presentation/src/themes.dart';

class NewsApp extends StatelessWidget {
  static const NewsApp _instance = NewsApp._internal();
  const NewsApp._internal();

  factory NewsApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return MaterialApp(
          title: AppStrings.newsApp,
          theme: myTheme,
          darkTheme: darkTheme,
          themeMode: state,
          debugShowCheckedModeBanner: false,
          home: const HomeView(),
        );
      },
    );
  }
}
