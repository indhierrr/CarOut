
import 'package:carout/Karyawan/PROD/tab/edithead.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class headprod extends StatefulWidget {
  const headprod({super.key});

  @override
  State<headprod> createState() => _headprodState();
}

class _headprodState extends State<headprod> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('divisi',).snapshots();
      
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        
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
                            editheadprod(docid: snapshot.data!.docs[index]),
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
                            snapshot.data!.docChanges[index].doc['timeposthead'],
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
      );
  }
}