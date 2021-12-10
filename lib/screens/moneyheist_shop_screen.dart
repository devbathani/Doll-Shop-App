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
          image: DecorationImage(
            image: AssetImage('assets/money_heist_bg.jpg'),
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
                  itemCount: moneyheist.length,
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
