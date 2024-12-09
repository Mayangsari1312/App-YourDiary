import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yourdiary3/pages/evening/evening_journal.dart';
import 'package:yourdiary3/theme.dart';

class EditEveningJournal extends StatefulWidget {
  const EditEveningJournal(
      {super.key, required this.document, required this.id});
  final Map<String, dynamic> document;
  final String id;

  @override
  State<EditEveningJournal> createState() => _EditEveningJournalState();
}

class _EditEveningJournalState extends State<EditEveningJournal> {
  TextEditingController _summaryController = TextEditingController();
  String percentage = "";
  String descFeeling = "";

  @override
  void initState() {
    super.initState();
    _summaryController =
        TextEditingController(text: widget.document["summary"]);
    percentage = widget.document["percentage"];
    descFeeling = widget.document["descFeeling"];
  }

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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EveningJournal()));
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
              "Edit and Delete Evening Journal",
              style: boldTextStyle.copyWith(color: blueColor, fontSize: 20),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 40,
      ),
      label("How well rested did you feel today?"),
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
      label("How would you describe how you’re feeling today?"),
      Row(
        children: [
          mainFocusSelect("Satisfied"),
          mainFocusSelect("Exited"),
          mainFocusSelect("Calm"),
          mainFocusSelect("Loved"),
          mainFocusSelect("Tired"),
        ],
      ),
      Row(
        children: [
          mainFocusSelect("Bored"),
          mainFocusSelect("Lonely"),
          mainFocusSelect("Distracted"),
          mainFocusSelect("Sad"),
          mainFocusSelect("Others"),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      label("Write a short summary of your day."),
      textField(context),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 50.0, left: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 130,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("evePrep")
                        .doc(widget.id)
                        .delete()
                        .then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EveningJournal()));
                    });
                    Fluttertoast.showToast(
                        msg:
                            "You have successfully deleted your Evening Journal",
                        gravity: ToastGravity.TOP,
                        webBgColor:
                            "linear-gradient(to bottom, #1C665B, #4B997E)",
                        timeInSecForIosWeb: 2);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EveningJournal()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/delete.png",
                        width: 30,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        "Delete",
                        style: boldTextStyle.copyWith(color: blue2Color),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blue2Color, // Warna border
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  )),
            ),
            Container(
              width: 130,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("evePrep")
                        .doc(widget.id)
                        .update({
                      "percentage": percentage,
                      "descFeeling": descFeeling,
                      "summary": _summaryController.text
                    });
                    Fluttertoast.showToast(
                        msg:
                            "You have successfully edited your Evening Journal",
                        gravity: ToastGravity.TOP,
                        webBgColor:
                            "linear-gradient(to bottom, #1C665B, #4B997E)",
                        timeInSecForIosWeb: 2);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EveningJournal()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/edit.png",
                        width: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Edit",
                        style: boldTextStyle.copyWith(color: blue2Color),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: blueColor,
                    elevation: 3,
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
            descFeeling = label;
          });
        },
        child: Chip(
          backgroundColor: descFeeling == label ? Colors.blue : blue2Color,
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
            controller: _summaryController,
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
