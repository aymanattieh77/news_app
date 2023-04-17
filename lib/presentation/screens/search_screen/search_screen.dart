import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/presentation/screens/home_screen/controller/news_cubit/news_cubit.dart';
import 'package:news/presentation/src/resources.dart';
import 'package:news/presentation/src/strings.dart';
import 'package:news/presentation/src/values.dart';

import 'package:news/presentation/widgets/build_listview_articles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.searchResults),
        leading: IconButton(
            onPressed: () {
              // BlocProvider.of<NavigationBarCubit>(context).stopSearch();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchField(context),
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsSearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NewsSearchSucsess) {
                  final news = state.articles;

                  return Expanded(child: BuildListViewArticles(articles: news));
                } else if (state is NewsSearchFailure) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget searchField(BuildContext context) {
    return Card(
      elevation: AppSizes.s20,
      color: Theme.of(context).cardColor,
      shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      child: Row(
        children: [
          const SizedBox(width: 5),
          Icon(
            Icons.search,
            color: Theme.of(context).splashColor,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: TextFormField(
              controller: searchController,
              onChanged: _startSearch,
              style: TextStyle(color: Theme.of(context).splashColor),
              onFieldSubmitted: _startSearch,
              decoration: InputDecoration(
                iconColor: Theme.of(context).splashColor,
                hintText: AppStrings.search,
                hintStyle: const TextStyle(color: ColorManager.grey),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                suffixIcon: IconButton(
                    onPressed: () {
                      searchController.clear();
                    },
                    icon: const Icon(Icons.clear)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _startSearch(String value) {
    BlocProvider.of<NewsCubit>(context).searchArticles.clear();
    BlocProvider.of<NewsCubit>(context).getSearchNewsData(value);
  }
}
