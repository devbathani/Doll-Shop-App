import 'package:firebase_auth/firebase_auth.dart';

class Usermodel {
  String? uid;
  String? username;
  String? phonenumber;
  String? email;

  Usermodel({this.uid, this.email, this.phonenumber, this.username});

  factory Usermodel.fromMap(map) {
    return Usermodel(
        uid: map['uid'],
        email: map['email'],
        phonenumber: map['phonenumber'],
        username: map['username']);
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'phonenumber': phonenumber,
      'username': username,
    };
  }
}
