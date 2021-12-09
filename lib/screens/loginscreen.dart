import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/google_sigin_provider.dart';
import 'package:shop_app/screens/signupscreen.dart';
import 'package:shop_app/transition/page_transition.dart';
import 'package:shop_app/transition/page_transition_left.dart';

import 'homescreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

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

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  void userlogin(String useremail, String userpass) async {
    if (_form.currentState!.validate()) {
      var userCred = await auth.signInWithEmailAndPassword(
          email: useremail, password: userpass);
      final userId = userCred.user;
      if (userId != null) {
        //showLoaderDialog(context);
        Fluttertoast.showToast(msg: "Login Success");
        Navigator.pushReplacement(
          context,
          CustomPageTransition(
            child: const Homescreen(),
          ),
        );
      }
    }
  }

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  bool _passwordVisible = true;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: h * 0.10, horizontal: w * 0.10),
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.4),
                    end: const Offset(0, 0.2),
                  ).animate(animationController),
                  child: FadeTransition(
                    opacity: animationController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to ",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: w / 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Text(
                          "INFINITY.LINKAGE",
                          style: GoogleFonts.sora(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: w / 12.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
                              Icons.email,
                              size: w / 18,
                              color: Colors.white,
                            ),
                            hintText: "Email",
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: w / 23),
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
                              // if (!RegExp(
                              //         r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$')
                              //     .hasMatch(value)) {
                              //   return 'Password must contain atleast one upper case, one lower case, one digit, one Specail Character and must be Must be at least 8 characters in length';
                              // }
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
                                    color: Colors.grey.shade300,
                                    fontSize: w / 23),
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
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.08,
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
                        userlogin(
                            emailcontroller.text, passwordcontroller.text);
                      },
                      child: Container(
                        height: h * 0.07,
                        width: w * 0.30,
                        decoration: BoxDecoration(
                          color: const Color(0xff0354bd),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xff0240a5),
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Color(0xff045cc8),
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Login",
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
              SizedBox(
                height: h * 0.18,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.5),
                  end: const Offset(0, 0.2),
                ).animate(animationController),
                child: FadeTransition(
                  opacity: animationController,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Don't have an account",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.grey.shade300,
                              fontSize: w / 22,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        Text(
                          "|",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: w / 21,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              CustomPageTransition(
                                child: const Signupscreen(),
                              ),
                            );
                          },
                          child: Text(
                            "SignUp",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: w / 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
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
                    padding: EdgeInsets.symmetric(horizontal: w * 0.45),
                    child: GestureDetector(
                      onTap: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.login();
                      },
                      child: SizedBox(
                        height: h * 0.05,
                        width: w * 0.15,
                        child: Image.asset(
                          "assets/google.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    content: Row(
      children: [
        SizedBox(
          height: 80,
          width: 90,
          child: Image.asset(
            "assets/loading.gif",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 7),
          child: const Text(
            "Loading...",
            style: TextStyle(
                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Homescreen()));
      });
      return alert;
    },
  );
}
