
import 'package:dio/dio.dart';

import '../const/strings.dart';
import '../models/ArticlesModle.dart';


class News_Services{
  final Dio dio;


  News_Services(this.dio);
 Future<List<Articlesmodle>> getNews() async
  {
   Response response =  await dio.get(ConstString.Egypt_Genral_News);
   Map<String,dynamic> JsonData = response.data;
   List <dynamic> articles = JsonData['articles'];
   List<Articlesmodle> articlelist =[];
  for(var articles in articles){
    Articlesmodle articlesmodle =Articlesmodle(
        imags: articles['urlToImage'],
        title: articles['title'],
        Subtitle: articles['description'],
        auther: articles['source']['name'],
        date: articles['publishedAt']
    );
    articlelist.add(articlesmodle);
  }
  return articlelist;
  }
}