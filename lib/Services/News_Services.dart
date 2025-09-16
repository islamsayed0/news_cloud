
import 'package:dio/dio.dart';

import '../const/strings.dart';
import '../models/ArticlesModle.dart';


class News_Services{
  final Dio dio;


  News_Services(this.dio);
  Future<List<Articlesmodle>> getNews() async {
    try {
      final Response response = await dio.get(ConstString.Gaza_Genral_News);

      final Map<String, dynamic> jsonData =
          response.data is Map<String, dynamic> ? response.data as Map<String, dynamic> : {};

      final List<dynamic> articles = (jsonData['articles'] as List<dynamic>?) ?? <dynamic>[];
      final List<Articlesmodle> articleList = <Articlesmodle>[];

      for (final dynamic article in articles) {
        if (article is Map<String, dynamic>) {
          final String imageUrl = (article['urlToImage'] as String?) ?? '';
          final String title = (article['title'] as String?) ?? '';
          final String description = (article['description'] as String?) ?? '';
          final String author = (article['source'] is Map<String, dynamic>)
              ? ((article['source'] as Map<String, dynamic>)['name'] as String? ?? '')
              : '';
          final String publishedAt = (article['publishedAt'] as String?) ?? '';

          final Articlesmodle articlesmodle = Articlesmodle(
            imags: imageUrl,
            title: title,
            Subtitle: description,
            auther: author,
            date: publishedAt,
          );
          articleList.add(articlesmodle);
        }
      }
      return articleList;
    } catch (_) {
      return <Articlesmodle>[];
    }
  }
}