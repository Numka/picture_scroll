import 'actions.dart';
import 'store.dart';

AppState reducers(AppState prevState, dynamic action) {
  if (action is UpdateFavorite) {
    return prevState.copyWith();
  } else if (action is FetchingImages) {
    return prevState.copyWith(
      isFetching: true,
    );
  } else if (action is FetchImagesSucceded) {
    return prevState.copyWith(
      images: action.fetchedImages,
      pageNumber: prevState.pageNumber + 1,
      isFetching: false,
    );
  } else if (action is FetchImagesFailed) {
    return prevState.copyWith(
      error: action.error,
    );
  } else {
    return prevState.copyWith();
  }
}
