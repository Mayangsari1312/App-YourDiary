import 'package:flutter/material.dart';
import 'package:yourdiary3/theme.dart';

class MorningButton extends StatelessWidget {
  const MorningButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 220,
      height: 90,
      child: OutlinedButton(
        onPressed: () {},
        child: Row(
          children: [
            Image.asset("assets/morning.png"),
            SizedBox(width: 8),
            Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Morning Preparation",
                  style: boldTextStyle,
                ),
                SizedBox(height: 8),
                Text(
                  "Let's start your day",
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
    );
  }
}
