import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/model/moneyheist_model.dart';
import 'package:shop_app/model/shop_model.dart';

class MoneyheistShopscreen extends StatefulWidget {
  final List<ShopModel> model;
  const MoneyheistShopscreen({Key? key, required this.model}) : super(key: key);

  @override
  _MoneyheistShopscreenState createState() => _MoneyheistShopscreenState();
}

class _MoneyheistShopscreenState extends State<MoneyheistShopscreen> {
  List<Moneyheist> moneyheist = [
    Moneyheist(
      name: "Professor",
      image: 'assets/professor.png',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: h * 0.03),
            //   child: Text(
            //     "Money Heist Dolls",
            //     style: GoogleFonts.poppins(
            //       textStyle: TextStyle(
            //           color: Colors.white,
            //           fontSize: w / 13,
            //           fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: h * 0.99,
              width: double.infinity,
              child: GridView.builder(
                itemCount: moneyheist.length,
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
                              height: h * 0.15,
                              width: w * 0.20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(moneyheist[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              moneyheist[index].name,
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
