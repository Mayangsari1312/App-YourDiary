import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:yourdiary3/TEST/evening_pre2.dart';
import 'package:yourdiary3/theme.dart';

class EveningPre1 extends StatefulWidget {
  final int initialValue;

  const EveningPre1({Key? key, this.initialValue = 0}) : super(key: key);

  @override
  _EveningPre1State createState() => _EveningPre1State();
}

class _EveningPre1State extends State<EveningPre1> {
  int currentValue = 0;
  int tag = 0;
  List<String> tags = [];
  List<String> options = [
    '0%',
    '25%',
    '50%',
    '75%',
    '100%',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  // curve: Curves.easeIn,
                  // duration: Duration(milliseconds: 500),
                  width: index == currentValue ? 50 : 20,
                  height: 8,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 200),
          Text("How well rested did you feel today?",
              style: boldTextStyle.copyWith(fontSize: 20, color: blueColor)),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              children: [
                ChipsChoice.single(
                  value: tag,
                  onChanged: (val) => setState(() => tag = val),
                  choiceItems: C2Choice.listFrom(
                      source: options, value: (i, v) => i, label: (i, v) => v),
                  wrapped: true,
                  choiceStyle: C2ChipStyle.toned(
                    height: 50,
                    borderStyle: BorderStyle.solid,
                    borderRadius: BorderRadius.circular(50),
                    backgroundColor: blue2Color,
                    backgroundOpacity: 1,
                    borderWidth: 1,
                    borderColor: blueColor,
                    foregroundStyle: lightTextStyle,
                    foregroundColor: blueColor,
                    selectedStyle: C2ChipStyle(
                        foregroundStyle: boldTextStyle,
                        borderColor: blueColor,
                        backgroundColor: blueColor,
                        borderWidth: 2),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 200),
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EveningPre2()));
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
        ],
      ),
    );
  }

  void moveToNext() {
    setState(() {
      currentValue = (currentValue + 1) % 3;
    });
  }
}
