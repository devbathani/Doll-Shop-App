import 'package:flutter/material.dart';
import 'package:shop_app/model/favourites_model.dart';
import 'package:hive/hive.dart';
part 'favourites_list_provider.g.dart';

@HiveType(typeId: 1)
class Favouriteslist extends ChangeNotifier {
  @HiveField(0)
  List<Favourite> favourites = [];

  additemsinlist(String _title, String _image) {
    favourites.add(Favourite(title: _title, image: _image));
    notifyListeners();
  }
}
