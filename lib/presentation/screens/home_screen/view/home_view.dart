import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'package:news/app/theme_cubit.dart';
import 'package:news/presentation/screens/home_screen/controller/bottom_bar_cubit/navigation_bar_cubit.dart';

import 'package:news/presentation/screens/search_screen/search_screen.dart';
import 'package:news/presentation/src/strings.dart';

import 'package:news/presentation/widgets/offline_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, connectivity, child) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return BlocBuilder<NavigationBarCubit, int>(
            builder: (context, index) {
              NavigationBarCubit.get(context).getNewsData(context);
              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                appBar: AppBar(
                  title: Text(NavigationBarCubit.listPages[AppStrings.titles]
                          [index] +
                      AppStrings.news),
                  actions: _appbarActions(context),
                ),
                body: IndexedStack(
                  index: index,
                  children: NavigationBarCubit.listPages[AppStrings.widgets],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: index,
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
          Navigator.pushReplacement(
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
}
