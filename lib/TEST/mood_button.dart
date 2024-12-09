import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yourdiary3/theme.dart';

class MoodButton extends StatefulWidget {
  const MoodButton({super.key});

  @override
  State<MoodButton> createState() => _MoodButtonState();
}

class _MoodButtonState extends State<MoodButton> {
  String currentImage = "assets/emote1.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          decoration: BoxDecoration(
              color: blue2Color, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg:
                                "I know it's tough right now, but remember that clouds eventually clear, and the sun will shine again. Reach out to someone you trust and let them be your support.",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            textColor: Colors.white,
                            webBgColor:
                                "linear-gradient(to bottom, #607D8B, #3F51B5)",
                            webPosition: "center",
                            fontSize: 16.0,
                          );
                        },
                        child: Image.asset("assets/emote1.png"))),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg:
                                "Disappointments are a part of life, but they don't define you. Use this moment to reflect, learn, and grow stronger. Tomorrow is a new opportunity.",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            textColor: Colors.white,
                            webBgColor:
                                "linear-gradient(to bottom, #FF9800, #E53935)",
                            webPosition: "center",
                            fontSize: 16.0,
                          );
                        },
                        child: Image.asset("assets/emote2.png"))),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg:
                                "In moments of neutrality, find peace in the stillness. Take a deep breath and appreciate the simple joys around you. Life is a journey, and every step is valuable.",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            textColor: Colors.white,
                            webBgColor:
                                "linear-gradient(to bottom, #9C27B0, #673AB7)",
                            webPosition: "center",
                            fontSize: 16.0,
                          );
                        },
                        child: Image.asset("assets/emote3.png"))),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg:
                                "Embrace the contentment you feel now. Celebrate your achievements, big or small. You've earned this moment of peace. Continue to savor the present.",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            textColor: Colors.white,
                            webBgColor:
                                "linear-gradient(to bottom, #4CAF50, #8BC34A)",
                            webPosition: "center",
                            fontSize: 16.0,
                          );
                        },
                        child: Image.asset("assets/emote4.png"))),
                MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                            msg:
                                "Your happiness is a testament to your resilience. Cherish these moments, surround yourself with positivity, and let the joy radiate within and beyond. You deserve it.",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 5,
                            textColor: Colors.white,
                            webBgColor:
                                "linear-gradient(to bottom, #2196F3, #001064)",
                            webPosition: "center",
                            fontSize: 16.0,
                          );
                        },
                        child: Image.asset("assets/emote5.png"))),
              ],
            ),
          ),
        ),
        // MOOD BUTTON
      ),
    );
  }
}
