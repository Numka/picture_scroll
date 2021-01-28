import '../models/image_item.dart';

abstract class Action {}

class ToggleFavorite extends Action {
  final String id;
  final bool isFavorite;

  ToggleFavorite(
    this.id,
    this.isFavorite,
  );
}

class UpdateFavorite extends Action {
  final List<ImageItem> imageList;
  final List<String> favoriteIdList;

  UpdateFavorite({
    this.imageList,
    this.favoriteIdList,
  });
}

class FetchImages extends Action {
  final int pageNumber;

  FetchImages(
    this.pageNumber,
  );
}

class FetchingImages extends Action {}

class FetchImagesSucceded extends Action {
  final List<ImageItem> fetchedImages;

  FetchImagesSucceded(
    this.fetchedImages,
  );
}

class FetchImagesFailed extends Action {
  final Exception error;

  FetchImagesFailed(
    this.error,
  );
}
