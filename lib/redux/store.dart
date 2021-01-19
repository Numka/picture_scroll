import '../models/image_item.dart';

class AppState {
  List<ImageItem> images;
  bool isFetching;
  Exception error;
  int pageNumber;

  AppState({
    this.images,
    this.isFetching,
    this.error,
    this.pageNumber,
  });

  AppState.copyWith({
    AppState prev,
    List<ImageItem> images,
  }) {
    this.images = images ?? prev.images;
  }

  AppState.initial() {
    this.images = [];
    this.isFetching = false;
    this.error = null;
    this.pageNumber = 1;
  }
}
