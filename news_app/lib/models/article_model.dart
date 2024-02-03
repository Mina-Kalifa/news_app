class ArticleModel {
  final String? image;
  final String? title;
  final String? description;
  final Uri? url;

  const ArticleModel(
      {required this.url,
      required this.image,
      required this.title,
      required this.description});

  factory ArticleModel.fromjson(Map<String, dynamic> json) {
    return ArticleModel(
        url: Uri.parse(json['url']),
        image: json['urlToImage'],
        title: json['title'],
        description: json['description']);
  }
}
