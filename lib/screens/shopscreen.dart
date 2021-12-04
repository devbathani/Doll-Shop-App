import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/screens/loginscreen.dart';
import 'package:shop_app/usermodel/user_model.dart';

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

  List<String> image = [
    "assets/naruto.png",
    "assets/kakashi.png",
    "assets/hinata.png",
    "assets/player_456.png",
    "assets/player_001.png"
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
              duration: const Duration(milliseconds: 600),
              child: Container(
                key: ValueKey<String>(image[currentPage]),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image[currentPage]),
                    //fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10,
                    sigmaY: 10,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: h * 0.10),
              child: FractionallySizedBox(
                heightFactor: h * 0.001,
                child: PageView.builder(
                  itemCount: image.length,
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
                        color: Colors.white.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.08),
                        child: Column(
                          children: [
                            SizedBox(
                              height: h * 0.25,
                              width: w * 0.35,
                              child: Image.asset(
                                image[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: h * 0.08,
                            ),
                            GestureDetector(
                              onTap: () {
                                logout(context);
                              },
                              child: Container(
                                height: h * 0.06,
                                width: w * 0.30,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(w / 30),
                                ),
                                child: Center(
                                  child: Text(
                                    "Logout",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: w / 23,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
