import 'actions.dart';
import 'store.dart';

AppState reducers(AppState prevState, dynamic action) {
  if (action is UpdateFavorite) {
    return AppState(
      images: action.imageList,
      pageNumber: prevState.pageNumber,
    );
  } else if (action is FetchImages) {
    return AppState(
      images: prevState.images,
      isFetching: true,
      error: null,
      pageNumber: prevState.pageNumber,
    );
  } else if (action is FetchImagesSucceded) {
    return AppState(
      images: action.fetchedImages,
      isFetching: false,
      error: null,
      pageNumber: action.nextPage,
    );
  } else if (action is FetchImagesFailed) {
    return AppState(
      images: [],
      isFetching: false,
      error: action.error,
      pageNumber: prevState.pageNumber,
    );
  } else {
    return AppState(
      images: prevState.images,
      pageNumber: prevState.pageNumber,
    );
  }
}
