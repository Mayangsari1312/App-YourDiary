import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:yourdiary3/TEST/morning_pre3.dart';
import 'package:yourdiary3/theme.dart';
import 'package:chips_choice/chips_choice.dart';

class MorningPre2 extends StatefulWidget {
  const MorningPre2({super.key});

  @override
  State<MorningPre2> createState() => _MorningPre2State();
}

class _MorningPre2State extends State<MorningPre2> {
  Future<void> sendDataToFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    final databaseReference = FirebaseDatabase.instance.ref();

    // Misal data yang ingin dikirim ke Firebase adalah data user dan data yang telah dipilih
    final dataUser = {
      'fullName': 'Asma Hafizhah',
      'email': 'asma.hafizhah@example.com',
    };

    final dataPicked = {
      'work': true,
      'relaxing': true,
      'partner': true,
      // Tambahkan data lain yang ingin dikirim ke Firebase
    };

    await databaseReference.child('User').push().set({
      ...dataUser,
      ...dataPicked,
    });
  }

  int currentValue = 1;
  int tag = 1;
  List<String> tags = [];
  List<String> options = [
    'Work',
    'Relaxing',
    'Family',
    'Friends',
    'Selfcare',
    'Partner',
    'Learning',
    'Party',
    'Music',
    'Cleaning',
    'Health',
    'Movies',
    'Gaming',
    'Travel',
    'Meal',
    'Shopping',
    'Sports',
    'Creative',
    'Pets',
    'Dates'
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
        SizedBox(height: 30),
        Text("What's your main focus for today?",
            style: boldTextStyle.copyWith(fontSize: 20, color: blueColor)),
        SizedBox(height: 20),
        Text("Pick up to 3!",
            style: lightTextStyle.copyWith(color: blueColor, fontSize: 14)),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              ChipsChoice<String>.multiple(
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
                      // sendDataToFirebase();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MorningPre3()));
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
