import 'package:flutter/material.dart';

class Colection_Items extends StatelessWidget {
  const Colection_Items({super.key, required this.img, required this.Text_item});
final String img;
final String Text_item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.fill,
        ),
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: 250,
      width: 250,
      child: Center(
          child: Text(
        "$Text_item" ,
        style:
        TextStyle(
            color: Colors.white,
          fontSize: 45,
          shadows: [
          Shadow(
            offset: Offset(2.0, 2.0),
            blurRadius: 3.0,
            color: Colors.black45,
          ),
        ],),
      )
      )
      ,
    );
  }
}
