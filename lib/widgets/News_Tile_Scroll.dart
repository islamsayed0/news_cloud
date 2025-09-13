import 'package:flutter/material.dart';

import 'News_Tile.dart';

class NewsTileScroll extends StatelessWidget {
  const NewsTileScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return          Expanded(
      child: ListView .builder(
        itemCount: 10,
        itemBuilder: (context , index){
          return NewsTile();
        },
      ),
    );
  }
}
