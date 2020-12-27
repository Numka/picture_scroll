import 'package:flutter/material.dart';
import 'package:picture_scroll/redux/actions.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './screens/image_detail_screen.dart';
import './screens/image_list_screen.dart';

import './redux/store.dart';
import './redux/reducers.dart';
import './redux/middleware.dart';

void main() {
  Store<AppState> _store = Store<AppState>(
    reducers,
    initialState: AppState.initial(),
    middleware: [
      fetchImagesMiddleware,
      appStateMiddleware,
    ],
  );
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store store;

  const MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    store.dispatch(FetchImages(store.state.pageNumber));
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Picture Scroll',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ImageListScreen(),
        routes: {
          ImageDetailScreen.routeName: (ctx) => ImageDetailScreen(),
        },
      ),
    );
  }
}
