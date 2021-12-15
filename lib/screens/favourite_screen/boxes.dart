import 'package:hive/hive.dart';
import 'package:shop_app/model/favourites_model.dart';
import 'package:shop_app/provider/favourites_list_provider.dart';

class Boxes {
  static Box<List<Favourite>> getItem() =>
      Hive.box<List<Favourite>>('favourites');
}
