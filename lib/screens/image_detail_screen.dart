import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
  static const routeName = '/image-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImageName #hardcode'),
      ),
      body: Center(
        child: Text('There goes the body'),
      ),
    );
  }
}
