import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/build_image_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTileWidget extends StatefulWidget {
  final ArticleModel articleModel;

  const NewsTileWidget({Key? key, required this.articleModel})
      : super(key: key);

  @override
  State<NewsTileWidget> createState() => _NewsTileWidgetState();
}

class _NewsTileWidgetState extends State<NewsTileWidget> {
  Future<void> _launchURL() async {
    if (widget.articleModel.url != null) {
      await launchUrl(widget.articleModel.url!);
    } else {
      throw 'Could not launch ${widget.articleModel.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            BuildImageWidget(articleModel: widget.articleModel),
            Text(
              widget.articleModel.title ?? ' ',
              maxLines: 2,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 25,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              widget.articleModel.description ?? ' ',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
