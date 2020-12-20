import 'actions.dart';
import 'store.dart';

AppState reducers(AppState prevState, dynamic action) {
  if (action is UpdateFavorite) {
    return AppState(
      images: action.imageList,
    );
  } else if (action is FetchImages) {
    return AppState(
      images: prevState.images,
      isFetching: true,
      error: null,
    );
  } else if (action is FetchImagesSucceded) {
    return AppState(
      images: action.fetchedImages,
      isFetching: false,
      error: null,
    );
  } else if (action is FetchImagesFailed) {
    return AppState(
      images: [],
      isFetching: false,
      error: action.error,
    );
  } else {
    return AppState(
      images: prevState.images,
    );
  }
}
