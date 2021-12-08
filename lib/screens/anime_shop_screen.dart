import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/model/shop_model.dart';

class AnimeShopScreen extends StatefulWidget {
  final ShopModel model;
  const AnimeShopScreen({Key? key, required this.model}) : super(key: key);

  @override
  _AnimeShopScreenState createState() => _AnimeShopScreenState(model: model);
}

class _AnimeShopScreenState extends State<AnimeShopScreen> {
  final ShopModel model;
  _AnimeShopScreenState({required this.model});
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
            image: AssetImage('assets/anime_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
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
              height: h * 0.08,
            ),
            Hero(
              tag: model.image,
              child: SizedBox(
                height: h * 0.20,
                width:  w*0.30,
                child: Image.asset(model.image,fit: BoxFit.cover,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
