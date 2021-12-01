import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/google_sigin_provider.dart';
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.02, vertical: h * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 20,
                    //backgroundImage: NetworkImage(user.currentUser!.photoURL!),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.08),
              child: Text(
                "${usermodel.username}   ${usermodel.phonenumber}",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: w / 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.30,
            ),
            GestureDetector(
              onTap: () {
                logout(context);
              },
              child: Container(
                height: h * 0.07,
                width: w * 0.30,
                decoration: BoxDecoration(
                  color: const Color(0xff072048),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Color(0xff092f6d),
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Logout",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: w / 18,
                            fontWeight: FontWeight.bold)),
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
