import 'package:picture_scroll/models/image_item.dart';
import 'package:redux/redux.dart';

import 'store.dart';
import 'actions.dart';

void appStateMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is ToggleFavorite) {
    //List<Object> imageList = store.state.images;
    var imageId = action.id;
    var favoriteStatus = action.isFavorite;
    List<ImageItem> imageList = store.state.images;

    // find the image that should be changed
    var loadedImage = store.state.images.firstWhere((el) => el.id == imageId);
    // find the index of the image that should be changed
    var replaceAt = store.state.images.indexWhere((el) => el.id == imageId);
    // generate new image with a new favorite status
    imageList[replaceAt] = ImageItem(
      id: loadedImage.id,
      title: loadedImage.title,
      imageUrl: loadedImage.imageUrl,
      isFavorite: !favoriteStatus,
    );

    store.dispatch(UpdateFavorite(imageList));
  }

  next(action);
}
