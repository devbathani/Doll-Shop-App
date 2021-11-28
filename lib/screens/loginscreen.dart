import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/google_sigin_provider.dart';

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
              Colors.blue.shade900,
              Colors.black,
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
                    child: Text(
                      "Welcome",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: w / 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                          keyboardType: TextInputType.name,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: w / 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              size: w / 18,
                              color: Colors.grey,
                            ),
                            hintText: "Username",
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey, fontSize: w / 20),
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
                            obscureText: true,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: w / 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                size: w / 18,
                                color: Colors.grey,
                              ),
                              hintText: "Password",
                              hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey, fontSize: w / 22),
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
                height: h * 0.06,
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
                    child: Container(
                      height: h * 0.07,
                      width: w * 0.30,
                      decoration: BoxDecoration(
                        color: const Color(0xff072048),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 15.0,
                            spreadRadius: 1.0,
                          ),
                          BoxShadow(
                            color: Color(0xff092f6d),
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
              SizedBox(
                height: h * 0.20,
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
                        Text(
                          "SignUp",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: w / 20,
                                fontWeight: FontWeight.bold),
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
