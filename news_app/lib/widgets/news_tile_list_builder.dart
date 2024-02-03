import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/news_tile_list_widget.dart';

class NewsTileListBuilder extends StatefulWidget {
  final String category;
  const NewsTileListBuilder({super.key, required this.category});
  @override
  State<NewsTileListBuilder> createState() => _NewsTileListBuilderState();
}

class _NewsTileListBuilderState extends State<NewsTileListBuilder> {
  var articles;

  @override
  void initState() {
    super.initState();
    articles = NewsService(category: widget.category).getNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: articles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsTileListWidget(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(child: Text('oops missed data'));
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
