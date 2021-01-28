import 'package:flutter/material.dart';
import '../models/image_item.dart';

class AppState {
  List<ImageItem> images;
  bool isFetching;
  Exception error;
  int pageNumber;
  List<String> favoriteIdList;

  AppState({
    @required this.images,
    @required this.isFetching,
    @required this.error,
    @required this.pageNumber,
    @required this.favoriteIdList,
  });

  AppState copyWith({
    AppState prev,
    List<ImageItem> images,
    bool isFetching,
    Exception error,
    int pageNumber,
    List<String> favoriteIdList,
  }) {
    return AppState(
      images: images ?? this.images,
      isFetching: isFetching ?? this.isFetching,
      error: error ?? this.error,
      pageNumber: pageNumber ?? this.pageNumber,
      favoriteIdList: favoriteIdList ?? this.favoriteIdList,
    );
  }

  AppState.initial(favIdList) {
    this.images = [];
    this.isFetching = false;
    this.error = null;
    this.pageNumber = 1;
    this.favoriteIdList = favIdList;
  }
}
