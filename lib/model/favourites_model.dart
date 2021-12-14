import 'package:hive/hive.dart';
part 'favourites_model.g.dart';

@HiveType(typeId: 1)
class Favourite extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String image;

  Favourite({required this.title, required this.image});
}
