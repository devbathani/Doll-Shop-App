import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/model/user_model.dart';
import 'package:shop_app/transition/page_transition_left.dart';

import 'loginscreen.dart';

class Drawerscreen extends StatefulWidget {
  const Drawerscreen({Key? key}) : super(key: key);

  @override
  State<Drawerscreen> createState() => _DrawerscreenState();
}

class _DrawerscreenState extends State<Drawerscreen> {
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
      CustomPageTransitionLeft(
        child: const Loginscreen(),
      ),
    );
  }

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
              Color(0xff0575E6),
              Color(0xff021B79),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: h * 0.10,
                    width: w * 0.20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/profile_demo.jpeg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${usermodel.username}",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: w / 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "${usermodel.phonenumber}",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: w / 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: h * 0.06,
              ),
              Container(
                height: h * 0.06,
                width: w * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(w / 60),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: w / 16.5,
                      ),
                      SizedBox(
                        width: w * 0.05,
                      ),
                      Text(
                        "Home",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: w / 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Container(
                height: h * 0.06,
                width: w * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(w / 60),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: w / 16.5,
                      ),
                      SizedBox(
                        width: w * 0.05,
                      ),
                      Text(
                        "Favourites",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: w / 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Container(
                height: h * 0.06,
                width: w * 0.45,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(w / 60),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.shopping_cart_rounded,
                        color: Colors.white,
                        size: w / 16.5,
                      ),
                      SizedBox(
                        width: w * 0.05,
                      ),
                      Text(
                        "My Cart",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: w / 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                child: GestureDetector(
                  onTap: () {
                    logout(context);
                  },
                  child: Container(
                    height: h * 0.06,
                    width: w * 0.35,
                    decoration: BoxDecoration(
                      color: const Color(0xff022889),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff011f7e),
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Color(0xff033193),
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(w / 60),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                      child: Center(
                        child: Text(
                          "Logout",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: w / 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
