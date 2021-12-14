import 'package:flutter/material.dart';
import 'package:shop_app/model/favourites_model.dart';

class Favouriteslist extends ChangeNotifier {
  List<Favourite> favourites = [];

  additemsinlist(String _title, String _image) {
    favourites.add(Favourite(_title, _image));
    notifyListeners();
  }

  
}
