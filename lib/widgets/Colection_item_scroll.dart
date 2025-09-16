import 'package:flutter/material.dart';

import '../models/item_colection_model.dart';
import 'Colection_Items.dart';

class ColectionItemScroll extends StatelessWidget {
  const ColectionItemScroll({super.key});



    @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 150,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder:(context , index){
              return Row(
                children: [
                  Colection_Items(
                    img: items[index].imgPath,
                    Text_item: items[index].name,
                  ),
                  if (index != items.length - 1)
                    SizedBox(width: 16),
                ],
              );

            }
        ),
      ),
    );
  }
}
