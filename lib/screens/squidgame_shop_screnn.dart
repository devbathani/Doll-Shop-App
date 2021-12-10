import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/model/anime_model.dart';
import 'package:shop_app/model/shop_model.dart';
import 'package:shop_app/model/squidgame_model.dart';

class SquidgameShopscreen extends StatefulWidget {
  const SquidgameShopscreen({Key? key}) : super(key: key);

  @override
  _SquidgameShopscreenState createState() => _SquidgameShopscreenState();
}

class _SquidgameShopscreenState extends State<SquidgameShopscreen> {
  List<Squidgame> squidgame = [
    Squidgame(name: 'Player 001', image: 'assets/player_001.png'),
    Squidgame(name: 'Player 014', image: 'assets/player_14.png'),
    Squidgame(name: 'Player 067', image: 'assets/player_067.png'),
    Squidgame(name: 'Player 199', image: 'assets/player_199.png'),
    Squidgame(name: 'Player 456', image: 'assets/player_456.png'),
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
          image: DecorationImage(
            image: AssetImage('assets/squid_game_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.08),
                child: Text(
                  "Anime Dolls",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: w / 13,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.90,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: squidgame.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
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
                            children: [
                              Container(
                                height: h * 0.15,
                                width: w * 0.20,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(squidgame[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                squidgame[index].name,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: w / 25,
                                      fontWeight: FontWeight.bold),
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
}
