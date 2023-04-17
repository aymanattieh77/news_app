import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/presentation/screens/home_screen/pages/pages.dart';

part 'navigation_bar_state.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(NavigationBarInitial());

  static NavigationBarCubit get(BuildContext context) =>
      BlocProvider.of(context);

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool isSearch = false;
  startSearch() {
    isSearch = true;
    emit(StartSearch());
  }

  stopSearch() {
    isSearch = false;
    emit(StopSearch());
  }

  static Map<String, dynamic> listPages = {
    'titles': ['Bussiness', 'Sports', 'Science', 'Top Headline'],
    'widgets': const [
      BussinessPage(),
      SportsPage(),
      SciencePage(),
      TopHeadLinePage(),
    ],
  };

  final navigataionBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.view_headline), label: 'headline'),
  ];

  void changeBar(int index) {
    _currentIndex = index;
    emit(NavigationBarNewIndex());
  }
}
