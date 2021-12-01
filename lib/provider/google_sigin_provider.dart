import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignin = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future login() async {
    final googleuser = await googleSignin.signIn();
    if (googleuser == null) return;
    _user = googleuser;

    final googleauth = await googleuser.authentication;

    final credentials = GoogleAuthProvider.credential(
      accessToken: googleauth.accessToken,
      idToken: googleauth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credentials);

    // notifyListeners();
  }

  Future logout() async {
    await googleSignin.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  
}
