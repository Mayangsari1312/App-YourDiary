import 'package:flutter/material.dart';
import 'package:yourdiary3/pages/profile/account_page.dart';
import 'package:yourdiary3/theme.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15, left: 15, right: 15, top: 0),
              child: Row(
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
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "About the App",
                    style:
                        boldTextStyle.copyWith(color: blueColor, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Image.asset(
                "assets/logo.png",
                width: 200,
              ),
            ),
            Center(
                child: Text(
              "YourDiary",
              style: boldTextStyle.copyWith(
                  color: blueColor, fontSize: 28, fontStyle: FontStyle.italic),
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome to YourDiary, a compassionate companion on your journey to mental well-being. Our purposeful app is meticulously crafted to provide support and tools for users seeking to nurture and enhance their mental health.',
              style: regulerTextStyle.copyWith(
                color: blueColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
