import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Services/News_Services.dart';
import '../models/ArticlesModle.dart';
import 'News_Tile.dart';

class NewsTileScroll extends StatefulWidget {
  const NewsTileScroll({super.key});

  @override
  State<NewsTileScroll> createState() => _NewsTileScrollState();
}

class _NewsTileScrollState extends State<NewsTileScroll> {
  List<Articlesmodle> articals = [];
  @override
  void initState()  {
    super.initState();
     getGenralNews();
  }

  Future<void> getGenralNews() async{
    final List<Articlesmodle> fetched = await News_Services(Dio()).getNews();
    if (!mounted) return;
    setState(() {
      articals = fetched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(
        childCount: articals.length
        ,(context,index){
      return NewsTile(articlesmodle: articals[index],);
    }
    ));
  }
}
