//import 'actions.dart';
import 'package:picture_scroll/redux/actions.dart';

//import '../models/image_item.dart';
import 'store.dart';

AppState reducers(AppState prevState, dynamic action) {
  if (action is ToggleFavorite) {
    var imageId = action.id;
    print(imageId);
    //var favoriteStatus = action.isFavorite;

    // var loadedImage = prevState.images.firstWhere((el) => el.id == imageId)
    //     as Object<dynamic>;
    //var replaceIndex = prevState.images.indexWhere((el) => el.id == imageId);
    //print(loadedImage);
    // prevState.images[replaceIndex] = ImageItem(
    //   id: loadedImage.id,
    //   title: null,
    //   imageUrl: null,
    //   isFavorite: null,
    // );

    return AppState(images: prevState.images);
  } else {
    return AppState(images: prevState.images);
  }
}
