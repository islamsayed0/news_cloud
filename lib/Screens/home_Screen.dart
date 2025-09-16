import 'package:flutter/material.dart';
import 'package:newsapp/main.dart';
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
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: GestureDetector(
          onTap: _scrollToTop, // هنا بقى التاب
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "News",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "Cloud",
                style: TextStyle(color: Colors.orangeAccent, fontSize: 30),
              )
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController, // مهم تربط الكنترولر هنا
        slivers: [
          SliverToBoxAdapter(
            child: ColectionItemScroll(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          NewsTileScroll(),
        ],
      ),
    );
  }
}
