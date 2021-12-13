import 'package:flutter/material.dart';
import 'package:shop_app/model/favourites_model.dart';

class Favouriteslist extends ChangeNotifier {
  List<Favourite> favourites = [];

  additemsinlist() {
    favourites.add(Favourite("Madara", 'assets/madara.png'));
    notifyListeners();
  }
}
