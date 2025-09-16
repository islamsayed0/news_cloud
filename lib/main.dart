import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Screens/home_Screen.dart';

void main() {
  runApp(const News_App());
}



class News_App extends StatelessWidget {
  const News_App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_Screen(),

    );
  }
}
