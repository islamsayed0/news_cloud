import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Services/News_Services.dart';
import '../models/ArticlesModle.dart';
import 'News_Tile.dart';

class NewsTileScroll extends StatefulWidget {
  const NewsTileScroll({super.key, required this.source});
  final String source;
  @override
  State<NewsTileScroll> createState() => _NewsTileScrollState();
}

class _NewsTileScrollState extends State<NewsTileScroll> {
  List<Articlesmodle> articals = [];
  late final News_Services service;
  bool isLoading = true;
  String? errorMessage;
  @override
  void initState()  {
    super.initState();
    service = News_Services(Dio());
    getGenralNews();
  }

  Future<void> getGenralNews() async{
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });
      List<Articlesmodle> fetched = [];
      if (widget.source == "EG") {
        fetched = await service.getEGNews();
      } else if (widget.source == "saudi") {
        fetched = await service.getSUNews();
      } else if (widget.source == "palestine") {
        fetched = await service.getPSNews();
      }
      if (!mounted) return;
      setState(() {
        articals = fetched;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
        errorMessage = "تعذر جلب الأخبار";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }
    if (errorMessage != null) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text(errorMessage!, textDirection: TextDirection.rtl)),
        ),
      );
    }
    if (articals.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text('لا توجد أخبار متاحة', textDirection: TextDirection.rtl)),
        ),
      );
    }
    return SliverList(delegate: SliverChildBuilderDelegate(
        childCount: articals.length
        ,(context,index){
      return NewsTile(articlesmodle: articals[index],);
    }
    ));
  }
}
