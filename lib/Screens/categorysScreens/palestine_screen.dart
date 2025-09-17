import 'package:flutter/material.dart';
import 'package:newsapp/widgets/App_Bar.dart';
import 'package:newsapp/widgets/Colection_item_scroll.dart';
import 'package:newsapp/widgets/News_Tile_Scroll.dart';

class PalestineScreen extends StatelessWidget {
   PalestineScreen({super.key});
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
      appBar: App_Bar(ontap: _scrollToTop,),
      body:  CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ColectionItemScroll(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          NewsTileScroll(source: 'palestine',),
        ],
      ),
    );
  }
}


