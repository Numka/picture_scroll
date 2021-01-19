import 'package:flutter/material.dart';
import '../models/image_item.dart';

class AppState {
  List<ImageItem> images;
  bool isFetching;
  Exception error;
  int pageNumber;

  AppState({
    @required this.images,
    @required this.isFetching,
    @required this.error,
    @required this.pageNumber,
  });

  AppState copyWith({
    AppState prev,
    List<ImageItem> images,
    bool isFetching,
    Exception error,
    int pageNumber,
  }) {
    return AppState(
      images: images ?? this.images,
      isFetching: isFetching ?? this.isFetching,
      error: error ?? this.error,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }

  AppState.initial() {
    this.images = [];
    this.isFetching = false;
    this.error = null;
    this.pageNumber = 1;
  }
}
