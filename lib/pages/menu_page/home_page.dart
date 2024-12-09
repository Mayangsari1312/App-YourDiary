import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yourdiary3/pages/evening/evening_pre.dart';
import 'package:yourdiary3/pages/morning/morning_pre.dart';
import 'package:yourdiary3/pages/profile/account_page.dart';
import 'package:yourdiary3/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      //TOP BAR
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/logo.png", width: 50),
                Text(
                  "How are you today?",
                  style: boldTextStyle.copyWith(fontSize: 16, color: blueColor),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountPage()));
                      },
                      child: Image.asset("assets/akun.png")),
                ),
              ],
            ),
          ),
          //TOP BAR

          // MOOD BUTTON
          Container(
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
                              timeInSecForIosWeb: 3,
                              textColor: Colors.white,
                              webBgColor:
                                  "linear-gradient(to bottom, #1C665B, #4B997E)",
                              webPosition: "center",
                              fontSize: 16.0,
                            );
                          },
                          child: Image.asset("assets/emote1.png", width: 30))),
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
                                  "linear-gradient(to bottom, #1C665B, #4B997E)",
                              webPosition: "center",
                              fontSize: 16.0,
                            );
                          },
                          child: Image.asset("assets/emote2.png", width: 30))),
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
                                  "linear-gradient(to bottom, #1C665B, #4B997E)",
                              webPosition: "center",
                              fontSize: 16.0,
                            );
                          },
                          child: Image.asset("assets/emote3.png", width: 30))),
                  MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onHover: (e) {
                        Container();
                      },
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
                                  "linear-gradient(to bottom, #1C665B, #4B997E)",
                              webPosition: "center",
                              fontSize: 16.0,
                            );
                          },
                          child: Image.asset("assets/emote4.png", width: 30))),
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
                                  "linear-gradient(to bottom, #1C665B, #4B997E)",
                              webPosition: "center",
                              fontSize: 16.0,
                            );
                          },
                          child: Image.asset("assets/emote5.png", width: 30))),
                ],
              ),
            ),
          ),
          // MOOD BUTTON

          // CALENDAR
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 30, right: 30, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: blue2Color,
                      borderRadius: BorderRadius.circular(20)),
                  child: TableCalendar(
                    locale: "en_US",
                    rowHeight: 35,
                    daysOfWeekHeight: 40,
                    headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle:
                            boldTextStyle.copyWith(color: Colors.white),
                        decoration: BoxDecoration(
                            color: blueColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)))),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: boldTextStyle,
                      weekendStyle: boldTextStyle,
                    ),
                    availableGestures: AvailableGestures.all,
                    focusedDay: DateTime.now(),
                    firstDay: DateTime(2010, 10, 16),
                    lastDay: DateTime(2030, 3, 14),
                    onDaySelected: _onDaySelected,
                    selectedDayPredicate: (day) => isSameDay(day, today),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: lightTextStyle,
                      outsideDaysVisible: false,
                      todayDecoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          // CALENDAR
          Container(
            child: Text("DAILY REFLECTIONS",
                style: boldTextStyle.copyWith(
                    color: blueColor, letterSpacing: 10.0)),
          ),
          SizedBox(height: 10),
          //MORNING BUTTON
          Container(
            width: MediaQuery.of(context).size.width - 210,
            height: 90,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MorningPre()));
              },
              child: Row(
                children: [
                  Image.asset("assets/morning.png", width: 80),
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
          ),
          // MORNING BUTTON

          //EVENING BUTTON
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width - 220,
            height: 90,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => EveningPre()));
              },
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
                  Image.asset("assets/evening.png", width: 60),
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
          ),
          //EVENING BUTTON
        ],
      ),
    ));
  }
}
