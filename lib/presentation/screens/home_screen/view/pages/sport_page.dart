import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news/presentation/screens/home_screen/controller/news_cubit/news_cubit.dart';
import 'package:news/presentation/widgets/build_listview_articles.dart';

import 'package:news/presentation/widgets/news_error_widgets.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is NewsSportLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsSportSucsess) {
          final news = state.articles;

          return BuildListViewArticles(articles: news);
        } else if (state is NewsSportFailure) {
          return showErrorContainer(context, state.err);
        } else {
          return Container();
        }
      },
    );
  }
}
