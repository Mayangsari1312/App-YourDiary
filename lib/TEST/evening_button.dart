import 'package:flutter/material.dart';
import 'package:yourdiary3/theme.dart';

class EveningButton extends StatelessWidget {
  const EveningButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 220,
      height: 90,
      child: OutlinedButton(
        onPressed: () {},
        child: Row(
          children: [
            SizedBox(width: 35),
            Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Evening Reflection",
                  style: boldTextStyle,
                ),
                SizedBox(height: 8),
                Text(
                  "Sum up your day",
                  style: lightTextStyle,
                ),
              ],
            ),
            SizedBox(width: 8),
            Image.asset("assets/evening.png"),
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
