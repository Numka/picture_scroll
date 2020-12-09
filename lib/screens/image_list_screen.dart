import 'package:flutter/material.dart';

import 'image_detail_screen.dart';

class ImageListScreen extends StatelessWidget {
  final String imageSrc =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzMjEx-ngHL_oeR54yKispWYWKT3mpkKi6Sg&usqp=CAU';

  @override
  Widget build(BuildContext context) {
    //final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image List Screen',
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext ctx, int index) => InkWell(
          onTap: () {
            Navigator.of(ctx).pushNamed(ImageDetailScreen.routeName);
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
                    imageSrc,
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
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      Text('Some text'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Stack(
//   children: [
//     Positioned(
//       bottom: 20,
//       left: 5,
//       child: Container(
//         width: 200,
//         color: Colors.black54,
//         padding: const EdgeInsets.all(5),
//         child: Text(
//           'Some text',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     ),
//   ],