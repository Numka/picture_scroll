import 'actions.dart';
import 'store.dart';

AppState reducers(AppState prevState, dynamic action) {
  if (action is UpdateFavorite) {
    return AppState(images: action.imageList);
  } else {
    return AppState(images: prevState.images);
  }
}
