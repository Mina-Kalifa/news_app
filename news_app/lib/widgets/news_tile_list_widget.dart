import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_tile_widget.dart';

class NewsTileListWidget extends StatelessWidget {
  const NewsTileListWidget({super.key, required this.articles});
  final List<ArticleModel> articles;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) => NewsTileWidget(articleModel: articles[index]),
      ),
    );
  }
}
