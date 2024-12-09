import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yourdiary3/TEST/morning_pre2.dart';
import 'package:yourdiary3/theme.dart';

class MorningPre1 extends StatefulWidget {
  final int initialValue;

  const MorningPre1({Key? key, this.initialValue = 0}) : super(key: key);

  @override
  _MorningPre1State createState() => _MorningPre1State();
}

class _MorningPre1State extends State<MorningPre1> {
  // void savePercentage(int percentage) async {
  //   // Buat referensi ke Firestore
  //   CollectionReference mornPrep =
  //       FirebaseFirestore.instance.collection('User');

  //   // Simpan data ke Firestore
  //   await mornPrep.doc().collection('mornP').add({
  //     'percentage': '$percentage%',
  //   });
  // }

  void main(int percentage) async {
    WidgetsFlutterBinding.ensureInitialized();

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Menambahkan document baru ke subcollection userInfo
    DocumentReference docRef =
        firestore.collection('User').doc('YVtTPPsSNe2ei2nVGCnC');
    // Mengisi data untuk document tersebut
    docRef.collection('mornP').add({
      'percentage': '$percentage%',
    });
  }
//   void main(int percentage) async {
//     WidgetsFlutterBinding.ensureInitialized();

//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user = auth.currentUser;

//     if (user != null) {
//         String userID = user.uid;
//         print("Current user's ID: $userID");

//         // Menambahkan document baru ke subcollection userInfo
//         DocumentReference docRef = firestore
//             .collection('User')
//             .doc(userID);
//         // Mengisi data untuk document tersebut
//         docRef.collection('mornP').add({
//       'percentage': '$percentage%',
//         });
//     } else {
//         print("No user is currently signed in.");
//     }
// }

  // CollectionReference _collectionRef =
  //     FirebaseFirestore.instance.collection('eveRef');

  // Future<void> getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await _collectionRef.get();

  //   // Get data from docs and convert map to List
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  //   print(allData);
  // }

  int currentValue = 0;

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
          Text("How well did you sleep today?",
              style: boldTextStyle.copyWith(fontSize: 20, color: blueColor)),
          SizedBox(height: 40),
          Center(
            child: Container(
              width: 400,
              decoration: BoxDecoration(
                  color: blue2Color, borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text("0%",
                              style: boldTextStyle.copyWith(fontSize: 11)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: blueColor, // Warna teks
                            side: BorderSide(color: blueColor, width: 3),
                            backgroundColor: blue2Color, // Warna border
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          )),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      child: OutlinedButton(
                          onPressed: () {
                            // savePercentage(25);
                            main(25);
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MorningPre2()));
                          },
                          child: Text("25%",
                              style: boldTextStyle.copyWith(fontSize: 11)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: blueColor, // Warna teks
                            side: BorderSide(color: blueColor, width: 3),
                            backgroundColor: blue2Color, // Warna border
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          )),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      child: OutlinedButton(
                          onPressed: () {
                            // savePercentage(50);
                          },
                          child: Text("50%",
                              style: boldTextStyle.copyWith(fontSize: 11)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: blueColor, // Warna teks
                            side: BorderSide(color: blueColor, width: 3),
                            backgroundColor: blue2Color, // Warna border
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          )),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      child: OutlinedButton(
                          onPressed: () {
                            // savePercentage(75);
                          },
                          child: Text("75%",
                              style: boldTextStyle.copyWith(fontSize: 11)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: blueColor, // Warna teks
                            side: BorderSide(color: blueColor, width: 3),
                            backgroundColor: blue2Color, // Warna border
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          )),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      child: OutlinedButton(
                          onPressed: () {
                            // savePercentage(100);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MorningPre2()));
                          },
                          child: Text("100%",
                              style: boldTextStyle.copyWith(fontSize: 11)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: blueColor, // Warna teks
                            side: BorderSide(color: blueColor, width: 3),
                            backgroundColor: blue2Color, // Warna border
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 200),
          ElevatedButton(
            onPressed: () {},
            child: Text('Activate Feeling Chip'),
          ),
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
                                builder: (context) => MorningPre2()));
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
