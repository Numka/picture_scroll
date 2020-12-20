//import 'actions.dart';
import 'package:picture_scroll/redux/actions.dart';

import '../models/image_item.dart';
import 'store.dart';

AppState reducers(AppState prevState, dynamic action) {
  if (action is ToggleFavorite) {
    var imageId = action.id;
    var favoriteStatus = action.isFavorite;

    // find the image that should be changed
    var loadedImage = prevState.images.firstWhere((el) => el.id == imageId);
    // find the index of the image that should be changed
    var replaceIndex = prevState.images.indexWhere((el) => el.id == imageId);
    // replace the image that should be changed with a new favorite status
    prevState.images[replaceIndex] = ImageItem(
      id: loadedImage.id,
      title: loadedImage.title,
      imageUrl: loadedImage.imageUrl,
      isFavorite: !favoriteStatus,
    );

    return AppState(images: prevState.images);
  } else {
    return AppState(images: prevState.images);
  }
}
