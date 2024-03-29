import 'package:hive/hive.dart';
part 'favourites_model.g.dart';

@HiveType(typeId: 0)
class Favourite {
  @HiveField(0)
  String title;

  @HiveField(1)
  String image;

  String get gettitle => title;
  String get getimage => image;

  Favourite({required this.title, required this.image});
}
