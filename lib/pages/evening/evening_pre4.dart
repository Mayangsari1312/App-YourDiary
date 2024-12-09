import 'package:flutter/material.dart';
import 'package:yourdiary3/theme.dart';
import 'package:yourdiary3/pages/navbar.dart';

class EveningPre4 extends StatelessWidget {
  const EveningPre4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/tree.png", width: 360),
            Positioned(
              right: 10,
              bottom: 80, // Sesuaikan posisi teks di dalam gambar
              child: Text("GOOD JOB!",
                  style: boldTextStyle.copyWith(
                      color: blueColor, fontSize: 20, letterSpacing: 10)),
            ),
          ],
        ),
        Text("You've Completed your Evening Reflection",
            style: lightTextStyle.copyWith(color: blueColor, fontSize: 14)),
        SizedBox(height: 130),
        Container(
          width: MediaQuery.of(context).size.width - 350,
          height: 40,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => NavBar()));
            },
            child: Text("Finish", style: boldTextStyle),
            style: OutlinedButton.styleFrom(
              foregroundColor: blueColor, // Warna teks
              side: BorderSide(color: blueColor, width: 2),
              backgroundColor: blue2Color, // Warna border
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        )
      ],
    );
  }
}
