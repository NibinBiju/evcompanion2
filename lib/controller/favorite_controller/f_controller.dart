import 'package:evcompanion2/model/favorite_model.dart';
import 'package:flutter/material.dart';

class FavoriteController with ChangeNotifier {
  List<FavoriteModel> favoriteList = [];

  void addToFav(FavoriteModel favoriteModel) {
    favoriteList.add(favoriteModel);
    print('hi');
    notifyListeners();
  }
}
