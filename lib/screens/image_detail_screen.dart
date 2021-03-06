import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/actions.dart';
import '../redux/store.dart';

class ImageDetailScreen extends StatelessWidget {
  static const routeName = '/image-detail';

  @override
  Widget build(BuildContext context) {
    final imageId = ModalRoute.of(context).settings.arguments as String;
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        var loadedImage = state.images.firstWhere((el) => el.id == imageId);
        return Scaffold(
            appBar: AppBar(
              title: Text(
                  'Author - ${loadedImage.title.length >= 20 ? loadedImage.title.substring(0, 20) + '...' : loadedImage.title}'),
            ),
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: double.infinity,
                  height: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      loadedImage.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          state.favoriteIdList.indexWhere(
                                      (idStr) => loadedImage.id == idStr) >
                                  -1
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                        ),
                        onPressed: () =>
                            StoreProvider.of<AppState>(context).dispatch(
                          ToggleFavorite(
                            loadedImage.id,
                            loadedImage.isFavorite,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'By ${loadedImage.title}',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
