import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card_widget.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
  });
  final List<CategoryModel> categoryItems = const [
    CategoryModel(image: 'assets/messi.jpg', text: 'messi'),
    CategoryModel(image: 'assets/business.webp', text: 'buisness'),
    CategoryModel(image: 'assets/health.jpg', text: 'health'),
    CategoryModel(image: 'assets/sports.jpg', text: 'sports'),
    CategoryModel(image: 'assets/technology.jpg', text: 'technology'),
    CategoryModel(image: 'assets/entertainment.jpg', text: 'entertainment'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryItems.length,
        itemBuilder: (context, index) => CategoryCard(
          category: categoryItems[index],
        ),
      ),
    );
  }
}
