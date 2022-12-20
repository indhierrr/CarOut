// ignore_for_file: must_be_immutable, camel_case_types, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:carout/Driver/jadwaldriver.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class editnoted extends StatefulWidget {
  DocumentSnapshot docid;
  editnoted({required this.docid});

  @override
  _editnotedState createState() => _editnotedState();
}

class _editnotedState extends State<editnoted> {
  TextEditingController bagian = TextEditingController();
  TextEditingController karyawan = TextEditingController();
  TextEditingController keperluan = TextEditingController();
  TextEditingController tujuan = TextEditingController();
  TextEditingController berangkat = TextEditingController();
  TextEditingController pulang = TextEditingController();
  TextEditingController driver = TextEditingController();
  TextEditingController kendaraan = TextEditingController();
  TextEditingController acchead = TextEditingController();
  TextEditingController accpjk= TextEditingController();
  TextEditingController accgam = TextEditingController();

  String date = DateTime.now().toIso8601String();

  CollectionReference ref = FirebaseFirestore.instance.collection('dalam perjalanan');


  @override
  void initState() {
    bagian = TextEditingController(text: widget.docid.get('bagian'));
    karyawan = TextEditingController(text: widget.docid.get('karyawan'));
    keperluan = TextEditingController(text: widget.docid.get('keperluan'));
    tujuan = TextEditingController(text: widget.docid.get('tujuan'));
    berangkat = TextEditingController(text: widget.docid.get('keberangkatan'));
    pulang = TextEditingController(text: widget.docid.get('perkiraan kembali'));
    driver = TextEditingController(text: widget.docid.get('driver'));
    kendaraan = TextEditingController(text: widget.docid.get('kendaraan'));
    acchead = TextEditingController(text: widget.docid.get('acchead'));
    accpjk = TextEditingController(text: widget.docid.get('accpjk'));
    accgam = TextEditingController(text: widget.docid.get('accgam'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              centerTitle: true,
              title: RichText(text: TextSpan(
                text: "DETAIL TUGAS LUAR",
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
                            builder: (context) => JadwalDriver()
                          )
                  );
              } ,
              )
            ),
    
      body: ListView(
        children: 
          [Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.only(right: 320),
                        child: Text(
                          'Bagian',
                          style: TextStyle(fontSize: 10,color: Color(0xff556E68),
                          
                          ),
                        ),
                      ),
                       Container(
                          child: TextField(
                            controller: bagian,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            
                            
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Bagian',
                            ),
                          ),
                          
                        ),
                      Container(
                        margin: EdgeInsets.only(right: 340),
                        child: Text(
                          'Karyawan',
                          style: TextStyle(fontSize: 10,color: Color(0xff556E68)
                          ),
                        ),
                      ),
                      Container(
                          child: TextField(
                            controller: karyawan,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Karyawan',
                            ),
                          ),

                        ),
                      Container(
                        margin: EdgeInsets.only(right: 340),
                        child: Text(
                        'Keperluan',
                       style: TextStyle(fontSize: 10,color: Color(0xff556E68)
                        ),
                      ),
                      ),
                      Container(
                          child: TextField(
                            controller: keperluan,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                             border: InputBorder.none,hintText: 'Keperluan',
                            ),
                          ),
                          
                        ),
                      Container(
                        margin: EdgeInsets.only(right: 355),
                        child: Text(
                        'Tujuan',
                        style: TextStyle(fontSize: 10,color: Color(0xff556E68)
                        ),
                      ),),
                      Container(
                          child: TextField(
                            controller: tujuan,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,hintText: 'Tujuan',
                            ),
                          ),
                          
                        ),
            Container(
                        margin: EdgeInsets.only(right: 280),
                        child: Text(
                        'Jadwal keberangkatan',
                        style: TextStyle(fontSize: 10,color: Color(0xff556E68)
                        ),
                      ),),
                         Container(
                          child: TextFormField(
                            controller: berangkat,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,hintText: 'Jadwal keberangkatan',
                            ),
                          ),
                          
                        ),
                      Container(
                        margin: EdgeInsets.only(right: 300),
                        child: Text(
                        'Perkiraan kembali',
                        style: TextStyle(fontSize: 10,color: Color(0xff556E68)
                        ),
                      ),),
                        Container(
                          child: TextFormField(
                            controller: pulang,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,hintText: 'Perkiraan kembali',
                            ),
                          ),
                          
                        ),
                      Container(
                        margin: EdgeInsets.only(right: 360),
                        child: Text(
                        'Driver',
                        style: TextStyle(fontSize: 10,color: Color(0xff556E68)
                        ),
                      ),),
                        Container(
                          child: TextFormField(
                            controller: driver,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,hintText: 'Driver',
                            ),
                          ),
                          
                        ),
                        Container(
                        margin: EdgeInsets.only(right: 337),
                        child: Text(
                        'Kendaraan',
                        style: TextStyle(fontSize: 10,color: Color(0xff556E68)
                        ),
                      ),),
                        Container(
                          child: TextFormField(
                            controller: kendaraan,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,hintText: 'Kendaraan',
                            ),
                          ),
                          
                        ),
                        Container(
                        margin: EdgeInsets.only(right: 250),
                        child: Text(
                        'Manager/DGM/GM/Direktur',
                        style: TextStyle(fontSize: 10,color: Color(0xff556E68)
                        ),
                      ),),
                        Container(
                          child: TextFormField(
                            controller: acchead,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,hintText: 'Manager/DGM/GM/Direktur',
                            ),
                          ),
                          
                        ),
                        
                      Container(
                        margin: EdgeInsets.only(right: 220),
                        child: Text(
                        'GA/Penanggungjawab Kendaraan',
                        style: TextStyle(fontSize: 10,color: Color(0xff556E68)
                        ),
                      ),),
                        Container(
                          child: TextFormField(
                            controller: accpjk,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,hintText: 'GA/Penanggungjawab Kendaraan',
                            ),
                          ),
                          
                        ),
                        
                       Container(
                        margin: EdgeInsets.only(right: 295),
                        child: Text(
                        'DGM Adminitration',
                        style: TextStyle(fontSize: 10,color: Color(0xff556E68)
                        ),
                      ),),
                        Container(
                          child: TextFormField(
                            controller: accgam,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,hintText: 'DGM Adminitration',
                            ),
                          ),
                          
                        ),
                      
                      Center( 
                        child: SizedBox(
                          height: 40,
                          width: 400,
                          child: MaterialButton(
                            onPressed: () {
                            ref.add({
                          'bagian': bagian.text,
                          'karyawan': karyawan.text,
                          'keperluan': keperluan.text,
                          'tujuan': tujuan.text,
                          'keberangkatan': berangkat.text,
                          'perkiraan kembali': pulang.text,
                          'driver': driver.text,
                          'kendaraan': kendaraan.text,
                          'acchead': acchead.text,
                          'accpjk': accpjk.text,
                          'accgam': accgam.text,
                          'getTime': date,
                          'start' : DateFormat.yMd().add_jm().format(DateTime.parse(date)) 
                        }
                        ).whenComplete(() {
                          widget.docid.reference.delete().whenComplete(() {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (_) => JadwalDriver()));
                        });
                        });
                      },
                            color:  Color(0xff293535),
                            child: Text(
                              "MULAI",
                               style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white
                                ),
                            )
                          )
                        )
                        ),
                                
                    ],
                  ),
                ),
          ),
        ],
      ),
        
      )
    ;
  }
}