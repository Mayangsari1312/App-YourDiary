import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yourdiary3/theme.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blue2Color,
        elevation: 0,
        title: Text(
          "Forgot Password",
          style: regulerTextStyle.copyWith(color: blueColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Insert your email and we will send you a password reset link to your email.",
              style: regulerTextStyle.copyWith(),
              textAlign: TextAlign.center,
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
          ElevatedButton(
            onPressed: passwordReset,
            child: Text(
              "Reset Password",
              style: regulerTextStyle.copyWith(color: blueColor),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: blue2Color),
          )
        ],
      ),
    );
  }
}
