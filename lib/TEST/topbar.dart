import 'package:flutter/material.dart';
import 'package:yourdiary3/theme.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/logo.png"),
            Text(
              "How are you today?",
              style: boldTextStyle.copyWith(fontSize: 16, color: blueColor),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Image.asset("assets/akun.png"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                // fixedSize: Size(50, 50)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
