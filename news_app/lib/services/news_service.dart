import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final String category;

  NewsService({required this.category});

  final Dio dio = Dio();
  List<ArticleModel> articlesModel = [];

  Future<List<ArticleModel>> getNews() async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/everything?q=$category&apiKey=5b80b3bfe0e24c7a82ccb0a958f60980');
      Map<String, dynamic> data = response.data;
      List<dynamic> articles = data['articles'];

      for (var article in articles) {
        articlesModel.add(ArticleModel.fromjson(article));
      }

      return articlesModel;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
