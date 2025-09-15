
import 'package:dio/dio.dart';

import '../const/strings.dart';


class News_Services{
  final Dio dio;


  News_Services(this.dio);
  getNews() async
  {
   Response response =  await dio.get(ConstString.Egypt_Genral_News);
   Map<String,dynamic> JsonData = response.data;
   List <dynamic> articles = JsonData['articles'];
  for(var articles in articles){
    // print(articles['source']['name']);
  }
  }
}