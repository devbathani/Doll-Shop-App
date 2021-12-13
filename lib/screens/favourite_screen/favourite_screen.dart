import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/favourites_list_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Favouriteslist>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: value.favourites.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(value.favourites[index].getimage),
                        fit: BoxFit.cover),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
