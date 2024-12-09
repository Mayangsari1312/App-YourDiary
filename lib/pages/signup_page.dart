import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yourdiary3/pages/login_page.dart';
import 'package:yourdiary3/pages/profile/privacy.dart';
import 'package:yourdiary3/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controller untuk mengelola inputan nama lengkap, email, dan kata sandi
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Fungsi untuk melakukan pendaftaran pengguna baru
  signUp() async {
    try {
      // Code ini mencoba membuat pengguna baru dengan email dan kata sandi yang diberikan
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      // Menampilkan pesan jika pendaftaran berhasil
      Fluttertoast.showToast(
          msg: "You have succesfully created an account, Log In Now",
          gravity: ToastGravity.TOP,
          webBgColor: "linear-gradient(to bottom, #1C665B, #4B997E)",
          timeInSecForIosWeb: 2);
      // Menambahkan detail pengguna ke Firebase Firestore
      addUserDetails();
    } on FirebaseAuthException catch (error) {
      // Menampilkan pesan toast jika terjadi kesalahan selama sign up
      Fluttertoast.showToast(
        msg: error.message!,
        webBgColor: "linear-gradient(to bottom, #1C665B, #4B997E)",
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
      );
    }
  }

  // Fungsi untuk menambahkan detail pengguna ke Firebase Firestore
  addUserDetails() async {
    // Mendapatkan referensi koleksi 'User' di Firestore
    CollectionReference collRef = FirebaseFirestore.instance.collection('User');
    // Menambahkan detail pengguna ke Firestore
    collRef.add({
      'fullName': _fullNameController.text,
      'email': _emailController.text,
    });
  }

  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  void dispose() {
    _fullNameController.dispose();
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
                                      builder: (context) => LoginPage()));
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
                Column(
                  children: [
                    Text("Create an account to",
                        style: regulerTextStyle.copyWith(
                            color: blueColor, fontSize: 14)),
                    Text("save your progress",
                        style: regulerTextStyle.copyWith(
                            color: blueColor, fontSize: 14)),
                  ],
                ),

                // FULLNAME TEXTFIELD
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 5.0),
                      child: Text(
                        "Full Name",
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
                        controller: _fullNameController,
                        style: regulerTextStyle.copyWith(color: blueColor),
                        cursorColor: blueColor,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Insert Full Name",
                            hintStyle: regulerTextStyle.copyWith(
                              color: blueColor.withOpacity(0.5),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),

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

                //SIGNUP BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: signUp,
                      child: Container(
                        width: MediaQuery.of(context).size.width - 220,
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: blue2Color,
                            border: Border.all(color: blueColor),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            "Create Account",
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
                      "By clicking Create Account, you agree",
                      style: regulerTextStyle.copyWith(color: blueColor),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "to our ",
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
                                    builder: (context) => PrivacyPage(),
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

                SizedBox(height: 90),

                //CREATE ACCOUNT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an Account?",
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
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          " Log In",
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
