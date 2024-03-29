import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/model/shop_model.dart';
import 'package:shop_app/screens/shopscreens/anime_shop_screen.dart';
import 'package:shop_app/screens/drawer_screen/cartscreen.dart';
import 'package:shop_app/screens/shopscreens/moneyheist_shop_screen.dart';
import 'package:shop_app/screens/shopscreens/squidgame_shop_screnn.dart';
import 'package:shop_app/transition/page_transition_down.dart';

class Shopscreen extends StatefulWidget {
  final VoidCallback opendrawer;
  const Shopscreen({
    Key? key,
    required this.opendrawer,
  }) : super(key: key);

  @override
  _ShopscreenState createState() => _ShopscreenState();
}

class _ShopscreenState extends State<Shopscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  List<ShopModel> shopmodel = [
    ShopModel(
      background: 'assets/anime_bg.jpg',
      image: 'assets/madara.png',
      title: 'Anime Dolls',
    ),
    ShopModel(
      background: 'assets/squid_game_bg.jpg',
      image: 'assets/player_001.png',
      title: "Squid Game Dolls",
    ),
    ShopModel(
      background: 'assets/money_heist_bg.jpg',
      image: 'assets/professor.png',
      title: 'Money Heist Dolls',
    ),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Container(
                key: ValueKey<String>(shopmodel[currentPage].background),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(shopmodel[currentPage].background),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: h * 0.025,
              left: w * 0.03,
              child: Row(
                children: [
                  SizedBox(
                    height: h * 0.08,
                    width: w * 0.08,
                    child: IconButton(
                      onPressed: widget.opendrawer,
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: w / 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.03),
                end: const Offset(0, 0.02),
              ).animate(animationController),
              child: FadeTransition(
                opacity: animationController,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.15),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      viewportFraction: w * 0.0026,
                      height: h * 0.65,
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      autoPlay: true,
                      pageSnapping: true,
                      onPageChanged: (val, reason) {
                        setState(() {
                          currentPage = val;
                        });
                      },
                    ),
                    items: shopmodel.map(
                      (model) {
                        final _model = model;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                          child: FractionallySizedBox(
                            heightFactor: h * 0.0013,
                            widthFactor: w * 0.00315,
                            child: Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: w * 0.08),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w / 25),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 0.08, horizontal: w * 0.05),
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(0, 0.002),
                                    end: const Offset(0, 0.001),
                                  ).animate(animationController),
                                  child: FadeTransition(
                                    opacity: animationController,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: h * 0.25,
                                          width: w * 0.33,
                                          child: Image.asset(
                                            model.image,
                                            fit: BoxFit.cover,
                                            scale: h * 0.009,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.05,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              model.title,
                                              style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: w / 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: h * 0.03,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  CustomPageTransitionDown(
                                                    child: _model.title.compareTo(
                                                                'Anime Dolls') ==
                                                            0
                                                        ? AnimeShopScreen(
                                                            model: shopmodel,
                                                          )
                                                        : _model.title.compareTo(
                                                                    'Squid Game Dolls') ==
                                                                0
                                                            ? SquidgameShopscreen(
                                                                model:
                                                                    shopmodel,
                                                              )
                                                            : MoneyheistShopscreen(
                                                                model:
                                                                    shopmodel,
                                                              ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: h * 0.055,
                                                width: w * 0.30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    w / 65,
                                                  ),
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "See more",
                                                    style: GoogleFonts.raleway(
                                                      textStyle: TextStyle(
                                                          fontSize: w / 23,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
