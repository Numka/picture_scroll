//import 'actions.dart';
import 'store.dart';

AppState reducers(AppState prevState, dynamic action) {
  return AppState(images: prevState.images);
}
