import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUserProvider extends ChangeNotifier {
  String _name = '';
  String _phoneNumber = '';
  Stream<User?>? user;

  final FirebaseAuth auth = FirebaseAuth.instance;

  String get name => _name;
  String get phoneNumber => _phoneNumber;

  void getUser() async {
    user = auth.authStateChanges();
    notifyListeners();
  }

  void setName(String val) {
    _name = val;
    notifyListeners();
  }

  void setPhone(String val) {
    _phoneNumber = val;
    notifyListeners();
  }
}
