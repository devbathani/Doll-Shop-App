import 'package:flutter/material.dart';
import 'package:shop_app/model/favourites_model.dart';

class Favouriteslist extends ChangeNotifier {
  List<Favourite> favourites = [];

  additemsinlist(String _title, String _image) {
    favourites.add(Favourite(title: _title, image: _image));
    notifyListeners();
  }

  
}
