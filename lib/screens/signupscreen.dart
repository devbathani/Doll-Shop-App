import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/screens/homescreen.dart';
import 'package:shop_app/usermodel/user_model.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();

  bool _passwordVisible = true;
  final auth = FirebaseAuth.instance;

  void signUp(String email, String password) async {
    if (_form.currentState!.validate()) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => postdetailtoFirestore())
          .catchError((e) {
        Fluttertoast.showToast(msg: "Signup Error");
      });
    }
  }

  postdetailtoFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    Usermodel usermodel = Usermodel(
        uid: user!.uid,
        email: user.email!,
        username: username.text,
        phonenumber: phonenumber.text);

    await firebaseFirestore
        .collection("user_name")
        .doc(user.uid)
        .set(usermodel.toMap());
    Fluttertoast.showToast(msg: "Account create successfully");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const Homescreen()),
        (route) => false);
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
              Colors.black,
              Colors.blue.shade900,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.04),
                  end: const Offset(0, 0.02),
                ).animate(animationController),
                child: FadeTransition(
                  opacity: animationController,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.10),
                    child: Stack(
                      children: [
                        Container(
                          height: h * 0.30,
                          width: w * 0.80,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/signupbg.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          bottom: h * 0.00,
                          right: w * 0.24,
                          child: Text(
                            "SignUp",
                            style: GoogleFonts.sora(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: w / 12.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Form(
                key: _form,
                child: Column(
                  children: [
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.5),
                        end: const Offset(0, 0.2),
                      ).animate(animationController),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                        child: TextFormField(
                          onSaved: (value) {
                            username.text = value!;
                          },
                          controller: username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username is required";
                            }

                            return null;
                          },
                          keyboardType: TextInputType.name,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: w / 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: InputDecoration(
                            errorStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.red,
                                fontSize: w / 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              size: w / 18,
                              color: Colors.white,
                            ),
                            hintText: "Username",
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey, fontSize: w / 23),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(w * 0.03),
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: w * 0.0015,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(w * 0.03),
                              ),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: w * 0.0015,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.5),
                        end: const Offset(0, 0.2),
                      ).animate(animationController),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phonenumber,
                          onSaved: (value) {
                            phonenumber.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please a phone number";
                            }
                            if (value == toString()) {
                              return "Enter a valid number";
                            }
                            if (value.length < 10) {
                              return "Enter a valid number";
                            }
                          },
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: w / 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: InputDecoration(
                            errorStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.red,
                                fontSize: w / 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              size: w / 18,
                              color: Colors.white,
                            ),
                            hintText: "Phone Number",
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey, fontSize: w / 23),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(w * 0.03),
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: w * 0.0015,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(w * 0.03),
                              ),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: w * 0.0015,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.5),
                        end: const Offset(0, 0.2),
                      ).animate(animationController),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                        child: TextFormField(
                          controller: emailcontroller,
                          onSaved: (value) {
                            emailcontroller.text = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Please enter a valid Email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: w / 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: InputDecoration(
                            errorStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.red,
                                fontSize: w / 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              size: w / 18,
                              color: Colors.white,
                            ),
                            hintText: "Email",
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey, fontSize: w / 23),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(w * 0.03),
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: w * 0.0015,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(w * 0.03),
                              ),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: w * 0.0015,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.5),
                        end: const Offset(0, 0.2),
                      ).animate(animationController),
                      child: FadeTransition(
                        opacity: animationController,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.08),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _passwordVisible,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: w / 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is required";
                              }

                              if (value.length < 8) {
                                return "Password must be atleast 8 characters long";
                              }
                              return null;
                            },
                            controller: passwordcontroller,
                            onSaved: (value) {
                              passwordcontroller.text = value!;
                            },
                            decoration: InputDecoration(
                              errorStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: w / 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              prefixIcon: Icon(
                                Icons.vpn_key_rounded,
                                size: w / 18,
                                color: Colors.white,
                              ),
                              hintText: "Password",
                              hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey, fontSize: w / 23),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(w * 0.03),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: w * 0.0015,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(w * 0.03),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: w * 0.0015,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.07,
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.5),
                        end: const Offset(0, 0.2),
                      ).animate(animationController),
                      child: FadeTransition(
                        opacity: animationController,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.35),
                          child: GestureDetector(
                            onTap: () {
                              signUp(emailcontroller.text,
                                  passwordcontroller.text);
                            },
                            child: Container(
                              height: h * 0.07,
                              width: w * 0.30,
                              decoration: BoxDecoration(
                                color: const Color(0xff0b3c88),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xff0e47a0),
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Color(0xff092a5f),
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "SignUp",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: w / 18,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
