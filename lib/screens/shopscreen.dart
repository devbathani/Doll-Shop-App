import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/model/shop_model.dart';
import 'package:shop_app/screens/loginscreen.dart';
import 'package:shop_app/model/user_model.dart';

class Shopscreen extends StatefulWidget {
  const Shopscreen({Key? key}) : super(key: key);

  @override
  _ShopscreenState createState() => _ShopscreenState();
}

class _ShopscreenState extends State<Shopscreen> {
  User? user = FirebaseAuth.instance.currentUser;

  Usermodel usermodel = Usermodel();

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("user_name")
        .doc(user!.uid)
        .get()
        .then((value) {
      usermodel = Usermodel.fromMap(value.data());
      setState(() {});
    });

    super.initState();
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Loginscreen()));
  }

  List<ShopModel> shopmodel = [
    ShopModel(
        background: 'assets/anime_bg.jpg',
        image: 'assets/hinata.png',
        title: 'Anime Dolls'),
    ShopModel(
        background: 'assets/squid_game_bg.jpg',
        image: 'assets/player_14.png',
        title: "Squid Game Dolls"),
    ShopModel(
        background: 'assets/money_heist_bg.jpg',
        image: 'assets/professor.png',
        title: 'Money Heist Dolls'),
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
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: h * 0.10),
              child: FractionallySizedBox(
                heightFactor: h * 0.0011,
                child: PageView.builder(
                  itemCount: shopmodel.length,
                  onPageChanged: (int val) {
                    setState(() {
                      currentPage = val;
                    });
                  },
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: w * 0.08),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w / 25),
                        color: Colors.white.withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.08),
                        child: Column(
                          children: [
                            SizedBox(
                              height: h * 0.30,
                              width: w * 0.35,
                              child: Image.asset(
                                shopmodel[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: h * 0.08,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  shopmodel[index].title,
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: w / 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.04,
                                ),
                                Container(
                                  height: h * 0.06,
                                  width: w * 0.30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(w / 65),
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "See more",
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            fontSize: w / 23,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
