import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/get_user.dart';
import 'package:shop_app/provider/google_sigin_provider.dart';
import 'package:shop_app/screens/authentication_screen/homescreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
