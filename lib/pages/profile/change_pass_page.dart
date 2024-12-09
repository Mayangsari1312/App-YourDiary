import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yourdiary3/pages/profile/account_page.dart';
import 'package:yourdiary3/theme.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link sent! Check your email"),
            );
          });
    } on FirebaseAuthException {
      Fluttertoast.showToast(
          msg: "Your account was not found",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15, left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountPage()));
                        },
                        child: Image.asset("assets/back.png"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: blueColor,
                          backgroundColor:
                              blue2Color, // ini warnanya masih salah
                          shape: CircleBorder(),
                          minimumSize: Size(10, 60),
                        )),
                  ),
                  Text(
                    "Account",
                    style:
                        boldTextStyle.copyWith(color: blueColor, fontSize: 20),
                  ),
                  Image.asset("assets/logo.png", width: 60),
                ],
              ),
            ),

            // LINKS
            Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                    color: blue2Color, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Account Setting",
                        style: boldTextStyle.copyWith(color: blueColor),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.password_rounded,
                    color: blueColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Change Password",
                    style: boldTextStyle.copyWith(color: blueColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    "Insert your email and we will send you a password reset link to your email.",
                    style: regulerTextStyle.copyWith(color: blueColor),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                //EMAIL TEXTFIELD
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
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: passwordReset,
                        child: Text(
                          "Reset Password",
                          style: regulerTextStyle.copyWith(color: blue2Color),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: blue2Color),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
