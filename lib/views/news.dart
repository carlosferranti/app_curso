import 'dart:convert';
import 'package:app_curso/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=br&apiKey=034e52a584874320808af9383665cb94";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = new ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: DateTime.parse(element['publishedAt']),
              content: element['content'],
            );
            news.add(articleModel);
          }
          //
        },
      );
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    print(category);

    String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=br&apiKey=034e52a584874320808af9383665cb94";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = new ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: DateTime.parse(element['publishedAt']),
              content: element['content'],
            );
            news.add(articleModel);
          }
        },
      );
    }
  }
}
