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

class AppState {
  List<ImageItem> images;

  AppState({
    this.images,
  });

  AppState.copyWith({
    AppState prev,
    List<ImageItem> images,
  }) {
    this.images = images ?? prev.images;
  }

  AppState.initial() {
    this.images = [
      ImageItem(
        id: 'img1',
        title: 'Mountains',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzMjEx-ngHL_oeR54yKispWYWKT3mpkKi6Sg&usqp=CAU',
        isFavorite: false,
      ),
      ImageItem(
        id: 'img2',
        title: 'A car',
        imageUrl:
            'https://static.themoscowtimes.com/image/1360/f7/1536670415_4x4_5d_motive_3.jpg',
        isFavorite: false,
      ),
      ImageItem(
        id: 'img3',
        title: 'A modern house',
        imageUrl:
            'https://images.adsttc.com/media/images/5e1d/02c3/3312/fd58/9c00/06e9/large_jpg/NewHouse_SA_Photo_01.jpg?1578959519',
        isFavorite: false,
      ),
      ImageItem(
        id: 'img4',
        title: 'A lake',
        imageUrl:
            'https://static.themoscowtimes.com/image/article_1360/2d/Jezioro_Bajka_2.jpg',
        isFavorite: false,
      ),
      ImageItem(
        id: 'img5',
        title: 'Medieval Knight',
        imageUrl:
            'https://cdna.artstation.com/p/assets/images/images/002/441/528/medium/vladimir-buchyk-01.jpg?1461778772',
        isFavorite: false,
      ),
    ];
  }
}
