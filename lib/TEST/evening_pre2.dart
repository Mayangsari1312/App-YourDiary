import 'package:flutter/material.dart';
import 'package:yourdiary3/TEST/evening_pre3.dart';
import 'package:yourdiary3/theme.dart';
import 'package:chips_choice/chips_choice.dart';

class EveningPre2 extends StatefulWidget {
  const EveningPre2({super.key});

  @override
  State<EveningPre2> createState() => _EveningPre2State();
}

class _EveningPre2State extends State<EveningPre2> {
  int currentValue = 1;
  String currentImage = "assets/emote1.png";
  int tag = 1;
  List<String> tags = [];
  List<String> options = [
    'Satisfied',
    'Exited',
    'Calm',
    'Loved',
    'Tired',
    'Bored',
    'Lonely',
    'Distracted',
    'Sad',
    'Angry',
    'Nervous',
    'Worried'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: AnimatedContainer(
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 500),
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
        SizedBox(height: 30),
        Text("How would you describe",
            style: boldTextStyle.copyWith(fontSize: 20, color: blueColor)),
        Text("how you're feeling today?",
            style: boldTextStyle.copyWith(fontSize: 20, color: blueColor)),
        SizedBox(height: 20),
        Text("Pick up to 3!",
            style: lightTextStyle.copyWith(color: blueColor, fontSize: 14)),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: ChipsChoice<String>.multiple(
                  value: tags,
                  alignment: WrapAlignment.center,
                  // onChanged: (val) => setState(() => tags = val),
                  onChanged: (val) {
                    if (val.length <= 3) {
                      setState(() => tags = val);
                    }
                  },
                  choiceItems: C2Choice.listFrom(
                      source: options, value: (i, v) => v, label: (i, v) => v),
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
                        borderWidth: 2),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 70),
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
                              builder: (context) => EveningPre3()));
                      // moveToNext();
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
    );
  }

  void moveToNext() {
    setState(() {
      currentValue = (currentValue + 1) % 3;
    });
  }
}
