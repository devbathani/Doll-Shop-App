import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/favourites_model.dart';
import 'package:shop_app/provider/favourites_list_provider.dart';
import 'package:shop_app/provider/get_user.dart';
import 'package:shop_app/provider/google_sigin_provider.dart';
import 'package:shop_app/screens/authentication_screen/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(FavouriteAdapter());
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox<Favourite>('favourites');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleSignInProvider>(
          create: (context) => GoogleSignInProvider(),
        ),
        ChangeNotifierProvider<GetUserProvider>(
          create: (context) => GetUserProvider()..getUser(),
        ),
        ChangeNotifierProvider<Favouriteslist>(
          create: (context) => Favouriteslist(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doll Shop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Homescreen(),
      ),
    );
  }
}
