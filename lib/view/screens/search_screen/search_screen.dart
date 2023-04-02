import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/controller/cubits/bottom_bar_cubit/navigation_bar_cubit.dart';
import 'package:news/controller/cubits/news_cubit/news_cubit.dart';

import 'package:news/view/widgets/article_item_card.dart';

import 'package:news/model/models/article.dart';

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
        title: const Text('Search Results'),
        leading: IconButton(
            onPressed: () {
              BlocProvider.of<NavigationBarCubit>(context).stopSearch();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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

                  return Expanded(child: _buildBussinessArticleItem(news));
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

  Widget _buildBussinessArticleItem(List<Article> articles) {
    final filterdArticles =
        articles.where((article) => article.author != null).toList();
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (ctx, index) {
        return ArticleItemCard(
          article: filterdArticles[index],
        );
      },
    );
  }

  Widget searchField(BuildContext context) {
    return Card(
      elevation: 20,
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
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
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
