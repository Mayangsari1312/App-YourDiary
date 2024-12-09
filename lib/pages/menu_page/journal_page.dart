import 'package:flutter/material.dart';
import 'package:yourdiary3/pages/evening/evening_journal.dart';
import 'package:yourdiary3/pages/morning/morning_journal.dart';
import 'package:yourdiary3/pages/profile/account_page.dart';
import 'package:yourdiary3/theme.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          //TOP BAR
          child: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/logo.png", width: 50),
              Text(
                "Journal",
                style: boldTextStyle.copyWith(fontSize: 16, color: blueColor),
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountPage()));
                    },
                    child: Image.asset("assets/akun.png")),
              ),
            ],
          ),
        ),
        //TOP BAR
        Image.asset(
          "assets/journal.png",
          width: 200,
        ),
        SizedBox(height: 10),
        //MORNING BUTTON
        Text(
          "RECENT ENTRIES",
          style: boldTextStyle.copyWith(
              color: blueColor, fontSize: 20, letterSpacing: 6),
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 150,
          height: 90,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MorningJournal()));
            },
            child: Row(
              children: [
                Image.asset("assets/morning.png", width: 80),
                SizedBox(width: 8),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Morning Journal",
                      style: boldTextStyle,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "See your morning journal here",
                      style: lightTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: blueColor, // Warna teks
              side: BorderSide(color: blueColor, width: 2),
              backgroundColor: blue2Color, // Warna border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        // MORNING BUTTON

        //EVENING BUTTON
        SizedBox(height: 30),

        Container(
          width: MediaQuery.of(context).size.width - 140,
          height: 90,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => EveningJournal()));
            },
            child: Row(
              children: [
                SizedBox(width: 25),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Evening Journal",
                      style: boldTextStyle,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "See your evening journal here",
                      style: lightTextStyle,
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Image.asset("assets/evening.png", width: 60),
              ],
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: blueColor, // Warna teks
              side: BorderSide(color: blueColor, width: 2),
              backgroundColor: blue2Color, // Warna border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        //EVENING BUTTON
      ])),
    );
  }
}
