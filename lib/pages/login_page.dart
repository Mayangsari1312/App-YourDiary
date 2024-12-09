import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yourdiary3/pages/forgot_password.dart';
import 'package:yourdiary3/pages/landing_page.dart';
import 'package:yourdiary3/pages/profile/privacy.dart';
import 'package:yourdiary3/pages/profile/terms.dart';
import 'package:yourdiary3/pages/signup_page.dart';
import 'package:yourdiary3/theme.dart';
import 'package:yourdiary3/pages/navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Fungsi berikut untuk menangani proses masuk (sign-in) menggunakan Firebase Authentication
  signIn() async {
    try {
      // Code berikut mencoba untuk masuk dengan menggunakan email dan kata sandi yang diberikan
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      // Jika email dan password sudah terdaftar maka akan diarahkan masuk ke HomePage
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NavBar()));

      // Jika sign in gagal,maka tampilkan pesan yang menunjukkan email atau kata sandi yang salah menggunakan package FlutterToast
    } on FirebaseAuthException {
      Fluttertoast.showToast(
        msg: "Incorrect Email or Password",
        webBgColor: "linear-gradient(to bottom, #1C665B, #4B997E)",
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
      );
    }
  }

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //TOP BAR
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 15, left: 15, right: 15, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: 55,
                        // height: 55,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingPage()));
                            },
                            child: Image.asset(
                              "assets/back.png",
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: blueColor,
                              backgroundColor: blue2Color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            )),
                      ),
                      Image.asset("assets/logo.png", width: 60),
                    ],
                  ),
                ),

                // WELCOME
                Text("WELCOME",
                    style: boldTextStyle.copyWith(
                        color: blueColor, fontSize: 24, letterSpacing: 12)),
                SizedBox(height: 10),
                Text("Log into your account",
                    style: regulerTextStyle.copyWith(
                        color: blueColor, fontSize: 14)),

                //EMAIL TEXTFIELD
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 5.0),
                      child: Text(
                        "Email",
                        style: regulerTextStyle.copyWith(color: blueColor),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: blue2Color,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        style: regulerTextStyle.copyWith(color: blueColor),
                        cursorColor: blueColor,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Insert Email",
                            hintStyle: regulerTextStyle.copyWith(
                              color: blueColor.withOpacity(0.5),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),

                //PASSWORD TEXTFIELD
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 5.0),
                      child: Text(
                        "Password",
                        style: regulerTextStyle.copyWith(
                            color: blueColor, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: blue2Color,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        style: regulerTextStyle.copyWith(color: blueColor),
                        obscureText: _secureText,
                        cursorColor: blueColor,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: showHide,
                              icon: _secureText
                                  ? Icon(
                                      Icons.visibility,
                                      size: 20,
                                      color: blueColor,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      size: 20,
                                      color: blueColor,
                                    ),
                            ),
                            border: InputBorder.none,
                            hintText: "Insert Password",
                            hintStyle: regulerTextStyle.copyWith(
                                color: blueColor.withOpacity(0.5),
                                fontSize: 14)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                //FORGOT PASSWORD
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: boldTextStyle.copyWith(
                          color: blueColor,
                          decoration: TextDecoration.underline,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                //SIGNIN BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: signIn,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 220,
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: blue2Color,
                            border: Border.all(color: blueColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: boldTextStyle.copyWith(color: blueColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                // TERMS OF USE
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your use of YourDiary is subject to",
                      style: regulerTextStyle.copyWith(color: blueColor),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "our ",
                        style: regulerTextStyle.copyWith(color: blueColor),
                        children: [
                          TextSpan(
                            text: "Terms of Use",
                            style: boldTextStyle.copyWith(
                              color: blueColor,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TermsPage(),
                                  ),
                                );
                              },
                          ),
                          TextSpan(
                            text: " and ",
                            style: regulerTextStyle.copyWith(color: blueColor),
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: boldTextStyle.copyWith(
                              color: blueColor,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PrivacyPage(),
                                  ),
                                );
                              },
                          ),
                          TextSpan(
                            text: ".",
                            style: regulerTextStyle.copyWith(color: blueColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 160),

                //CREATE ACCOUNT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Need an Account?",
                      style: boldTextStyle.copyWith(
                          color: blueColor, fontSize: 16),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: Text(
                          " Sign Up",
                          style: boldTextStyle.copyWith(
                              color: blueColor,
                              decoration: TextDecoration.underline,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
