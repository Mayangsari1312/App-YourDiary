import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourdiary3/pages/morning/morning_pre4.dart';
import 'package:yourdiary3/pages/navbar.dart';
import 'package:yourdiary3/theme.dart';

class MorningPre extends StatefulWidget {
  const MorningPre({super.key});

  @override
  State<MorningPre> createState() => _MorningPreState();
}

class _MorningPreState extends State<MorningPre> {
  // Controller untuk mengelola inputan plan
  TextEditingController _planController = TextEditingController();
  // Variabel untuk menyimpan persentase tidur dan mainFocus yang dipilih
  String percentage = "";
  String mainFocus = "";
  // Variabel untuk menyimpan informasi pengguna yang sedang log in
  User? userId = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            // padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding:
            const EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => NavBar()));
                  },
                  child: Image.asset("assets/back.png"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: blueColor,
                    backgroundColor: blue2Color, // ini warnanya masih salah
                    shape: CircleBorder(),
                    minimumSize: Size(10, 60),
                  )),
            ),
            SizedBox(width: 10),
            Text(
              "Begin your morning preparation",
              style: boldTextStyle.copyWith(color: blueColor, fontSize: 20),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 40,
      ),
      label("How well did you sleep today?"),
      Row(
        children: [
          percentageSelect("0%"),
          percentageSelect("25%"),
          percentageSelect("50%"),
          percentageSelect("75%"),
          percentageSelect("100%"),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      label("What’s your main focus for today?"),
      Row(
        children: [
          mainFocusSelect("Work"),
          mainFocusSelect("Relaxing"),
          mainFocusSelect("Learning"),
          mainFocusSelect("Friends"),
          mainFocusSelect("Party"),
        ],
      ),
      Row(
        children: [
          mainFocusSelect("Selfcare"),
          mainFocusSelect("Partner"),
          mainFocusSelect("Family"),
          mainFocusSelect("Cleaning"),
          mainFocusSelect("Others"),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      label("What do you plan to do today?"),
      textField(context),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 60,
              height: 60,
              child: OutlinedButton(
                  onPressed: () {
                    // Menngedit data ke Firestore menggunakan instance FirebaseFirestore
                    FirebaseFirestore.instance
                        .collection(
                            "mornPrep") // Mengakses koleksi "mornPrep" di Firestore
                        .doc() // Membuat dokumen baru dengan ID otomatis
                        .set({
                      "percentage":
                          percentage, // Menyimpan nilai percentage ke dalam dokumen
                      "mainFocus":
                          mainFocus, // Menyimpan nilai mainFocus ke dalam dokumen
                      "plan": _planController
                          .text, // Menyimpan teks dari _planController ke dalam dokumen
                      "userId": userId?.uid // Menyimpan userId ke dalam dokumen
                    });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MorningPre4()));
                  },
                  child: Image.asset("assets/next.png"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: blueColor, // Warna teks
                    side: BorderSide(color: blueColor, width: 1),
                    backgroundColor: blue2Color, // Warna border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )),
            ),
          ],
        ),
      ),
    ])));
  }

  Widget percentageSelect(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            percentage = label;
          });
        },
        child: Chip(
          backgroundColor: percentage == label ? Colors.blue : blue2Color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide.none,
          label: Text(
            label,
            style: boldTextStyle.copyWith(color: blueColor),
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 3.8),
        ),
      ),
    );
  }

  Widget mainFocusSelect(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            mainFocus = label;
          });
        },
        child: Chip(
          backgroundColor: mainFocus == label ? Colors.blue : blue2Color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide.none,
          label: Text(
            label,
            style: boldTextStyle.copyWith(color: blueColor),
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 3.8),
        ),
      ),
    );
  }

  Widget textField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(),
        child: TextFormField(
            controller: _planController,
            maxLines: 10,
            style: regulerTextStyle.copyWith(color: blueColor, fontSize: 14),
            decoration: InputDecoration(
              hintText: 'Start Writing...',
              hintStyle: lightTextStyle.copyWith(
                  color: blueColor), // Text yang muncul ketika TextField kosong
              border: OutlineInputBorder(
                borderSide: BorderSide(color: blueColor),
                borderRadius: BorderRadius.circular(25.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: blueColor),
                borderRadius: BorderRadius.circular(25.0),
              ),
              filled: true,
              fillColor: blue2Color,
            )),
      ),
    );
  }
}

Widget label(String label) {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Text(label,
        style: boldTextStyle.copyWith(color: blueColor, fontSize: 16)),
  );
}
