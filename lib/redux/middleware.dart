import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'store.dart';
import 'actions.dart';

import '../models/image_item.dart';

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

void fetchImagesMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) async {
  if (action is FetchImages) {
    var url = 'https://api.unsplash.com/photos?page=${action.pageNumber}';

    try {
      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader:
              'Client-ID 7lwjXNsrx2zYwoV-V-8VNoCaaNOiB8pS_6LqNJc21qc'
        },
      );
      var extractedImages = json.decode(response.body) as List<dynamic>;

      List<ImageItem<dynamic>> imageList = store.state.images;
      for (var image in extractedImages) {
        imageList.add(ImageItem(
          id: image['id'],
          title: image['user']['name'],
          imageUrl: image['urls']['small'],
          isFavorite: false,
        ));
      }
      store
          .dispatch(FetchImagesSucceded(imageList, store.state.pageNumber + 1));
    } catch (error) {
      store.dispatch(FetchImagesFailed(error));
    }
  }

  next(action);
}
