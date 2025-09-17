import 'package:flutter/material.dart';
import 'package:newsapp/Screens/categorysScreens/CountryNewsScreen.dart';

import '../models/item_colection_model.dart';
import 'Colection_Items.dart';
import '../Screens/categorysScreens/palestine_screen.dart';

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
              final item = items[index];
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      String? source;
                      String title = item.name;
                      if (item.name.contains('فلسطين')) {
                        source = 'palestine';
                      } else if (item.name.contains('السعوديه')) {
                        source = 'saudi';
                      } else if (item.name.contains('مصر')) {
                        source = 'EG';
                      }
                      if (source != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CountryNewsScreen(source: source!, title: title),
                          ),
                        );
                      }
                    },
                    child: Colection_Items(
                      img: item.imgPath,
                      Text_item: item.name,
                    ),
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
