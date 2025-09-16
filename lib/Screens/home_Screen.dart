import 'package:flutter/material.dart';
import '../widgets/Colection_item_scroll.dart';
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
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: GestureDetector(
          onTap: _scrollToTop,
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "اخبار",
                style: TextStyle(fontSize: 35,fontFamily: 'logofont'),
              ),
              Text(
                "الشرق",
                style: TextStyle(color: Colors.orangeAccent, fontSize: 35, fontFamily: 'logofont'),
              )
            ],
          ),
        ),

      ),
      body: CustomScrollView(
        controller: _scrollController,
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
