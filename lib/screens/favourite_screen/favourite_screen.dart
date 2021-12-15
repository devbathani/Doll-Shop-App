import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_app/provider/favourites_list_provider.dart';
import 'package:hive/hive.dart';
import 'package:shop_app/screens/favourite_screen/boxes.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  Future addItem(String title, String image) async {
    final List<Favouriteslist> item = [];

    final box = Boxes.getItem();
    box.add(item);
  }

  @override
  void dispose() {
    Hive.box('favourites').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    Widget builditem(List<Favouriteslist> item) {
      return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff021B79),
              Color(0xff0575E6),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Favourites",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: w / 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                SizedBox(
                  height: h * 0.76,
                  child: GridView.builder(
                    itemCount: item.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.95,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: h * 0.01,
                          horizontal: w * 0.02,
                        ),
                        child: Container(
                          height: h * 0.50,
                          width: w * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w / 25),
                            color: Colors.white.withOpacity(0.35),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: h * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: h * 0.15,
                                  width: w * 0.20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          item[index].favourites[index].image),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                                Text(
                                  item[index].favourites[index].title,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: w / 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: ValueListenableBuilder<Box<List<Favouriteslist>>>(
        valueListenable: Boxes.getItem().listenable(),
        builder: (context, box, _) {
          final item = box.values.toList().cast<Favouriteslist>();

          return builditem(item);
        },
      ),
    );
  }
}
