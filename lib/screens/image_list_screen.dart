import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/actions.dart';
import '../redux/store.dart';

import 'image_detail_screen.dart';

class ImageListScreen extends StatefulWidget {
  @override
  _ImageListScreenState createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final store = StoreProvider.of<AppState>(context);
        store.dispatch(FetchImages(store.state.pageNumber));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image List Screen',
        ),
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) => ListView.builder(
          controller: _scrollController,
          itemCount: state.images.length,
          itemBuilder: (BuildContext ctx, int index) => InkWell(
            onTap: () {
              Navigator.of(ctx).pushNamed(
                ImageDetailScreen.routeName,
                arguments: state.images[index].id,
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      state.images[index].imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            state.images[index].isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          onPressed: () =>
                              StoreProvider.of<AppState>(context).dispatch(
                            ToggleFavorite(
                              state.images[index].id,
                              state.images[index].isFavorite,
                            ),
                          ),
                        ),
                        Text(
                          state.images[index].title,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
