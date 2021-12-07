import 'package:flutter/material.dart';
import 'package:shop_app/screens/cartscreen.dart';
import 'package:shop_app/screens/drawerscreen.dart';
import 'package:shop_app/screens/shopscreen.dart';

class MainShopscreen extends StatefulWidget {
  const MainShopscreen({Key? key}) : super(key: key);

  @override
  State<MainShopscreen> createState() => _MainShopscreenState();
}

class _MainShopscreenState extends State<MainShopscreen> {
  late double x = x;

  late double y = y;

  late double scale = scale;

  bool isdragging = false;

  @override
  void initState() {
    super.initState();
    closedrawer();
  }

  void opendrawer() {
    setState(() {
      x = 210;
      y = 160;
      scale = 0.7;
    });
  }

  void closedrawer() {
    setState(() {
      x = 0;
      y = 0;
      scale = 1;
    });
  }

  Widget drawerscreen() => const Drawerscreen();

  Widget shopscreenprofiledrawer() {
    return GestureDetector(
      onHorizontalDragStart: (details) => isdragging = true,
      onHorizontalDragUpdate: (details) {
        const delta = 1;
        if (details.delta.dx > delta) {
          opendrawer();
        } else if (details.delta.dx < -delta) {
          closedrawer();
        }
        isdragging = false;
      },
      onTap: closedrawer,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        transform: Matrix4.translationValues(x, y, 0)..scale(scale),
        child: Shopscreen(opendrawer: opendrawer),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          drawerscreen(),
          shopscreenprofiledrawer(),
        ],
      ),
    );
  }
}
