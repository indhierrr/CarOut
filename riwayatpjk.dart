import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'MenuPjk.dart';
import 'editriwayatpjk.dart';

class riwayatpjk extends StatelessWidget {
  const riwayatpjk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lihat Jadwal' ,
      theme: ThemeData(),
      home: JadwalDriv(),
    );
  }
}

class JadwalDriv extends StatefulWidget {
  const JadwalDriv({super.key});

  @override
  State<JadwalDriv> createState() => _JadwalDrivState();
}

class _JadwalDrivState extends State<JadwalDriv> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('FINISH').snapshots();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              centerTitle: true,
              title: RichText(text: TextSpan(
                text: "RIWAYAT",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff293535),
                  fontWeight: FontWeight.bold
                ),
              ),),
              backgroundColor: Colors.white,
              leading: GestureDetector(
              child: Icon( Icons.arrow_back_ios, color: Color(0xff293535),  ),
              onTap: () {
                Navigator.push(
                    context,
                          // DetailPage adalah halaman yang dituju 
                          MaterialPageRoute(
                            builder: (context) => MenuPjk()
                          )
                  );
              } ,
              )
            ),
body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                   Navigator.pushReplacement(
                     context,
                      MaterialPageRoute(
                        builder: (_) =>
                            editriwayat(docid: snapshot.data!.docs[index]),
                      ),
                  );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Color(0xff556E68),
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snapshot.data!.docChanges[index].doc['karyawan'],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                            snapshot.data!.docChanges[index].doc['finish'],
                            style: TextStyle(
                              fontSize: 10, color: Color(0xff556E68),
                            ),
                          ),
                            ],
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}