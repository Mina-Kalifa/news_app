import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_list_widget.dart';
import 'package:news_app/widgets/news_tile_list_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(fontSize: 28, color: Colors.black),
            ),
            Text(
              'Cloud',
              style: TextStyle(fontSize: 28, color: Colors.orange),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CategoryListWidget(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            NewsTileListBuilder(category: category),
          ],
        ),
      ),
    );
  }
}
