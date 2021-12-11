import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/model/anime_model.dart';
import 'package:shop_app/model/shop_model.dart';

class AnimeShopScreen extends StatefulWidget {
  final List<ShopModel> model;
  const AnimeShopScreen({Key? key, required this.model}) : super(key: key);

  @override
  _AnimeShopScreenState createState() => _AnimeShopScreenState();
}

class _AnimeShopScreenState extends State<AnimeShopScreen> {
  List<Anime> anime = [
    Anime(
      name: 'Madara',
      image: 'assets/madara.png',
    ),
    Anime(
      name: 'Gaara',
      image: 'assets/gaara.png',
    ),
    Anime(
      name: 'Naruto',
      image: 'assets/naruto.png',
    ),
    Anime(
      name: 'Hinata',
      image: 'assets/hinata.png',
    ),
    Anime(
      name: 'Sasuke',
      image: 'assets/sasuke.png',
    ),
    Anime(
      name: 'Uchiha',
      image: 'assets/uchiha.png',
    ),
    Anime(
      name: 'Kakashi',
      image: 'assets/kakashi.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
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
        child: Column(
          
          children: [
            SizedBox(
              height: h * 0.99,
              child: GridView.builder(
                itemCount: anime.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              height: h * 0.12,
                              width: w * 0.15,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(anime[index].image),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Text(
                              anime[index].name,
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
    );
  }
}
