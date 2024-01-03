// import 'package:evcompanion2/controller/favorite_controller/f_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MyFavourites extends StatefulWidget {
//   const MyFavourites({super.key});

//   @override
//   State<MyFavourites> createState() => _MyFavouritesState();
// }

// class _MyFavouritesState extends State<MyFavourites> {
//   FavoriteController favoriteController = FavoriteController();

//   @override
//   Widget build(BuildContext context) {
//     var favContro = Provider.of<FavoriteController>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "My Favorites",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: List.generate(favContro.favoriteList.length, (index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Color.fromARGB(255, 231, 231, 231),
//               ),
//               width: double.infinity,
//               height: 100,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 favContro.favoriteList[index].stationName,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
//                             ],
//                           ),
//                           Text(favContro.favoriteList[index].location),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
import 'package:evcompanion2/controller/favorite_controller/f_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavourites extends StatefulWidget {
  const MyFavourites({super.key});

  @override
  State<MyFavourites> createState() => _MyFavouritesState();
}

class _MyFavouritesState extends State<MyFavourites> {
  FavoriteController favoriteController = FavoriteController();

  @override
  Widget build(BuildContext context) {
    var favContro = Provider.of<FavoriteController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Favorites",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: List.generate(favContro.favoriteList.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 231, 231, 231),
              ),
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                favContro.favoriteList[index].stationName,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                
                                  setState(() {
                                    favContro.favoriteList.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                          Text(favContro.favoriteList[index].location),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
