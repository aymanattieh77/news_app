import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'package:news/controller/cubits/bottom_bar_cubit/navigation_bar_cubit.dart';
import 'package:news/controller/cubits/news_cubit/news_cubit.dart';
import 'package:news/controller/cubits/theme_cubit.dart';

import 'package:news/view/screens/search_screen/search_screen.dart';

import 'package:news/view/widgets/offline_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, connectivity, child) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return BlocBuilder<NavigationBarCubit, NavigationBarState>(
            builder: (context, state) {
              int currentIndex = NavigationBarCubit.get(context).currentIndex;
              getNewsData(currentIndex, context);
              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                appBar: AppBar(
                  title: Text(NavigationBarCubit.listPages['titles']
                          [currentIndex] +
                      ' news'),
                  actions: _appbarActions(context),
                ),
                body: IndexedStack(
                  index: currentIndex,
                  children: NavigationBarCubit.listPages['widgets'],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: NavigationBarCubit.get(context).changeBar,
                  items: NavigationBarCubit.get(context).navigataionBarItems,
                ),
              );
            },
          );
        } else {
          return OffLineWidget(connected: connected);
        }
      },
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  List<Widget> _appbarActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const SearchScreen(),
            ),
          );
        },
      ),
      IconButton(
        icon: const Icon(Icons.dark_mode),
        onPressed: () {
          BlocProvider.of<ThemeCubit>(context).changeThemeMode();
        },
      ),
    ];
  }

  void getNewsData(int index, BuildContext context) {
    final newsCubit = BlocProvider.of<NewsCubit>(context);
    switch (index) {
      case 0:
        newsCubit.getBussinessNewsData('money');
        return;
      case 1:
        newsCubit.getSportNewsData('sports');
        return;
      case 2:
        newsCubit.getScienceNewsData('science');
        return;
      case 3:
        newsCubit.getTopHeadlineNewsData('us');
        return;
      default:
        return;
    }
  }
}
