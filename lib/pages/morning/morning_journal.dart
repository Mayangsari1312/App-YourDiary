import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourdiary3/pages/morning/edit_morning_journal.dart';
import 'package:yourdiary3/pages/navbar.dart';
import 'package:yourdiary3/theme.dart';

class MorningJournal extends StatefulWidget {
  const MorningJournal({super.key});

  @override
  State<MorningJournal> createState() => _MorningJournalState();
}

class _MorningJournalState extends State<MorningJournal> {
  // Variabel untuk menyimpan informasi pengguna yang sedang masuk
  User? userId = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          //TOP BAR
          child: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => NavBar()));
                    },
                    child: Image.asset("assets/back.png"),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: blueColor,
                      backgroundColor: blue2Color, // ini warnanya masih salah
                      shape: CircleBorder(),
                      minimumSize: Size(10, 60),
                    )),
              ),
              Text(
                "Morning Journal",
                style: boldTextStyle.copyWith(fontSize: 16, color: blueColor),
              ),
              Image.asset("assets/logo.png", width: 50),
            ],
          ),
        ),
        //TOP BAR
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: blue3Color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, // warna bayangan
                  offset: Offset(
                      0, 3), // geser bayangan secara horizontal dan vertikal
                  blurRadius: 6.0, // radius blur bayangan
                  spreadRadius: 2.0, // sebaran bayangan
                ),
              ],
            ),
            child: StreamBuilder(
                // Stream Builder untuk memantau perubahan data di Firestore
                stream: FirebaseFirestore.instance
                    .collection(
                        "mornPrep") // Mengakses koleksi "mornPrep" di Firebase Firestore
                    .where("userId",
                        isEqualTo:
                            userId?.uid) // Memfilter dokumen berdasarkan userId
                    .snapshots(), // Mendapatkan aliran data realtime dari Firestore
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  // mengecek jika tidak ada data yang diterima,jika tidak ada maka tampilkan progres indicator
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    //jika menerima data maka akan menampilkan data menggunakan listview builder
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        // Ambil data dari dokumen Firestore
                        Map<String, dynamic> document =
                            snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditMorningJournal(
                                          document: document,
                                          id: snapshot.data!.docs[index].id)));
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: blue2Color,
                                      border: Border.all(color: blueColor),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ListTile(
                                    leading: Image.asset("assets/sun1.png",
                                        width: 30),
                                    title: Text(
                                      document["mainFocus"],
                                      style: boldTextStyle.copyWith(
                                          color: blueColor, fontSize: 16),
                                    ),
                                    subtitle: Text(
                                      document['plan'],
                                      style: regulerTextStyle.copyWith(
                                          color: blueColor, fontSize: 14),
                                    ),
                                    trailing: Text(
                                      document['percentage'],
                                      style: boldTextStyle.copyWith(
                                          color: blueColor, fontSize: 14),
                                    ),
                                    mouseCursor: SystemMouseCursors.click,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
        )
      ])),
    );
  }
}
