import 'package:flutter/foundation.dart';

class ImageItem<Map> {
  String id;
  String title;
  String imageUrl;
  bool isFavorite = false;

  ImageItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.isFavorite,
  });
}
