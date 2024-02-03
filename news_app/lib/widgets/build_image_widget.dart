import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class BuildImageWidget extends StatelessWidget {
  const BuildImageWidget({
    super.key,
    required this.articleModel,
  });

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey,
      ),
      child: articleModel.image != null
          ? CachedNetworkImage(
              imageUrl: articleModel.image!,
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )
          : const Center(
              child: Text(
                'No Image',
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}
