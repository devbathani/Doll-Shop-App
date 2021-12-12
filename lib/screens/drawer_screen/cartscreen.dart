import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key}) : super(key: key);

  @override
  _CartscreenState createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
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
              const Color(0xff0575E6),
              const Color(0xff021B79).withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: h * 0.02, vertical: h * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: h * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: w / 15,
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    Text(
                      "My Cart",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: w / 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Container(
                height: h * 0.08,
                width: w * 0.58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w / 55),
                  color: Colors.white.withOpacity(0.4),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: Row(
                    children: [
                      SizedBox(
                        height: h * 0.05,
                        width: w * 0.05,
                        child: Image.asset(
                          'assets/naruto.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: w * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Naruto",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: w / 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.005,
                          ),
                          Row(
                            children: [
                              Container(
                                height: h * 0.03,
                                width: w * 0.15,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.circular(w / 75)),
                                child: Center(
                                  child: Text(
                                    "Qty : 1",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: w / 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w * 0.005,
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                                size: w / 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Text(
                        "500 Rs",
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
                height: h * 0.08,
                width: w * 0.58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w / 55),
                  color: Colors.white.withOpacity(0.4),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: Row(
                    children: [
                      SizedBox(
                        height: h * 0.05,
                        width: w * 0.05,
                        child: Image.asset(
                          'assets/player_001.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: w * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Player 001",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: w / 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.005,
                          ),
                          Row(
                            children: [
                              Container(
                                height: h * 0.03,
                                width: w * 0.15,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.circular(w / 75)),
                                child: Center(
                                  child: Text(
                                    "Qty : 1",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: w / 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w * 0.005,
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                                size: w / 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Text(
                        "500 Rs",
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
                height: h * 0.08,
                width: w * 0.58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w / 55),
                  color: Colors.white.withOpacity(0.4),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: Row(
                    children: [
                      SizedBox(
                        height: h * 0.05,
                        width: w * 0.05,
                        child: Image.asset(
                          'assets/professor.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: w * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Professor",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: w / 21,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.005,
                          ),
                          Row(
                            children: [
                              Container(
                                height: h * 0.03,
                                width: w * 0.15,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.circular(w / 75)),
                                child: Center(
                                  child: Text(
                                    "Qty : 1",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: w / 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w * 0.005,
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                                size: w / 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Text(
                        "500 Rs",
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
            ],
          ),
        ),
      ),
    );
  }
}
