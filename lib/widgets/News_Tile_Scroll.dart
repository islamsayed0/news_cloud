import 'package:flutter/material.dart';

import 'News_Tile.dart';

class NewsTileScroll extends StatelessWidget {
  const NewsTileScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate(
        childCount: 10,(context,index){
      return NewsTile();
    }
    ));
  }
}
