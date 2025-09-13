import 'package:flutter/material.dart';
import 'package:newsapp/main.dart';

import '../models/item_colection_model.dart';
import '../widgets/Colection_Items.dart';
import '../widgets/Colection_item_scroll.dart';
import '../widgets/News_Tile.dart';
import '../widgets/News_Tile_Scroll.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("News",style: TextStyle(fontSize: 30),),
            Text("Cloud",style: TextStyle(color: Colors.orangeAccent,fontSize: 30),)
          ],
        ),
      ),
      body:
      CustomScrollView(
      slivers: [
          SliverToBoxAdapter(
            child: ColectionItemScroll(),
          ),
          SliverToBoxAdapter(
          child:
          SizedBox(height: 20,)
          ),
          NewsTileScroll(),
        ],
      )


    );
  }

}
