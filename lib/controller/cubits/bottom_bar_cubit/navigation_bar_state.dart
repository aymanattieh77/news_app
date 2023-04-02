part of 'navigation_bar_cubit.dart';

@immutable
abstract class NavigationBarState {}

class NavigationBarInitial extends NavigationBarState {}

class NavigationBarNewIndex extends NavigationBarState {}

class StartSearch extends NavigationBarState {}

class StopSearch extends NavigationBarState {}
