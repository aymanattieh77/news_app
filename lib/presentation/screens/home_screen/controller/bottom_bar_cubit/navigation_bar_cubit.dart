import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presentation/screens/home_screen/controller/news_cubit/news_cubit.dart';

import 'package:news/presentation/screens/home_screen/view/pages/pages.dart';
import 'package:news/presentation/src/strings.dart';

class NavigationBarCubit extends Cubit<int> {
  NavigationBarCubit() : super(0);

  static NavigationBarCubit get(BuildContext context) =>
      BlocProvider.of(context);

  static Map<String, dynamic> listPages = {
    AppStrings.titles: [
      AppStrings.bussiness,
      AppStrings.sports,
      AppStrings.science,
      AppStrings.topHeadline
    ],
    AppStrings.widgets: const [
      BussinessPage(),
      SportsPage(),
      SciencePage(),
      TopHeadLinePage(),
    ],
  };

  final navigataionBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: AppStrings.bussiness),
    const BottomNavigationBarItem(
        icon: Icon(Icons.sports), label: AppStrings.sports),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science), label: AppStrings.science),
    const BottomNavigationBarItem(
        icon: Icon(Icons.view_headline), label: AppStrings.topHeadline),
  ];

  void changeBar(int index) {
    emit(index);
  }

  void getNewsData(BuildContext context) {
    switch (state) {
      case 0:
        BlocProvider.of<NewsCubit>(context).getBussinessNewsData();
        return;
      case 1:
        BlocProvider.of<NewsCubit>(context).getSportsNewsData();
        return;
      case 2:
        BlocProvider.of<NewsCubit>(context).getScienceNewsData();
        return;
      case 3:
        BlocProvider.of<NewsCubit>(context).getTopHeadlineNewsData();
        return;

      default:
        BlocProvider.of<NewsCubit>(context).getSportsNewsData();
        return;
    }
  }
}
