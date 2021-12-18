import 'package:flutter/material.dart';
import 'package:shop_app/model/favourites_model.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Favouriteslist extends ChangeNotifier {
  @HiveField(0)
  List<Favourite> _favourites = [];

  List<Favourite> get favouriteList => _favourites;

  additemsinlist(String _title, String _image) async {
    _favourites.add(
      Favourite(title: _title, image: _image),
    );
    var box = await Hive.openBox('favourites');
    box.add(_favourites);
    print(box);
    notifyListeners();
  }

 
}
