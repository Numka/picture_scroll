import 'package:flutter/material.dart';
import 'package:picture_scroll/screens/image_detail_screen.dart';

import './screens/image_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Scroll',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ImageListScreen(),
      routes: {
        ImageDetailScreen.routeName: (ctx) => ImageDetailScreen(),
      },
    );
  }
}
