// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_list_provider.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteslistAdapter extends TypeAdapter<Favouriteslist> {
  @override
  final int typeId = 1;

  @override
  Favouriteslist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favouriteslist()..favourites = (fields[0] as List).cast<Favourite>();
  }

  @override
  void write(BinaryWriter writer, Favouriteslist obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.favourites);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteslistAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
