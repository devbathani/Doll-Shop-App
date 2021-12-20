import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_like_button/insta_like_button.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/anime_model.dart';
import 'package:shop_app/model/shop_model.dart';
import 'package:shop_app/provider/favourites_list_provider.dart';
import 'package:shop_app/transition/page_transition_left.dart';
import 'package:like_button/like_button.dart';
import 'mainshopscreen.dart';

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

  bool isLiked = false;
  int likeCount = 0;

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            CustomPageTransitionLeft(
                              child: const MainShopscreen(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: w / 25,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: w * 0.13,
                      ),
                      Text(
                        "Anime Dolls",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: w / 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                SizedBox(
                  height: h * 0.77,
                  child: GridView.builder(
                    itemCount: anime.length,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.03,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: h * 0.14,
                                        width: w * 0.19,
                                        child: InstaLikeButton(
                                          onChanged: () {
                                            final provider =
                                                Provider.of<Favouriteslist>(
                                                    context,
                                                    listen: false);
                                            provider.additemsinlist(
                                              anime[index].name,
                                              anime[index].image,
                                            );
                                          },
                                          image: AssetImage(anime[index].image),
                                          icon: Icons.favorite,
                                          iconSize: w / 5,
                                          curve: Curves.bounceOut,
                                          iconColor:
                                              Colors.white.withOpacity(0.4),
                                          duration:
                                              const Duration(milliseconds: 500),
                                          imageBoxfit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      const Spacer(),
                                      LikeButton(
                                        isLiked: isLiked,
                                        likeCount: likeCount,
                                        // onTap: (isLiked) async {
                                        //   this.isLiked = !isLiked;
                                        //   likeCount += this.isLiked ? 1 : -1;
                                        //   return !isLiked;
                                        // },
                                        likeBuilder: (bool isLiked) {
                                          return Icon(
                                            Icons.favorite,
                                            color: isLiked
                                                ? Colors.pink
                                                : Colors.white,
                                            size: w / 13,
                                          );
                                        },
                                        countBuilder:
                                            (likeCount, isLiked, text) {
                                          final color = isLiked
                                              ? Colors.white
                                              : Colors.white60;

                                          return Text(
                                            text,
                                            style: GoogleFonts.robotoMono(
                                              textStyle: TextStyle(
                                                color: color,
                                                fontSize: w / 25,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        },
                                        likeCountAnimationType:
                                            LikeCountAnimationType.part,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        likeCountPadding: EdgeInsets.symmetric(
                                          vertical: h * 0.01,
                                        ),
                                        countPostion: CountPostion.bottom,
                                        bubblesSize: w / 11,
                                        circleColor: const CircleColor(
                                          start: Colors.white,
                                          end: Colors.red,
                                        ),
                                        bubblesColor: const BubblesColor(
                                          dotPrimaryColor: Colors.white,
                                          dotSecondaryColor: Colors.pinkAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.04,
                                      ),
                                      child: Text(
                                        anime[index].name,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: w / 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: w / 18,
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}
