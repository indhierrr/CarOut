
import 'package:carout/Karyawan/PROD/Menukaryawan.dart';
import 'package:carout/Karyawan/PROD/role.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class Addprod extends StatelessWidget {
  const Addprod({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lihat Jadwal',
      theme: ThemeData(),
      home: addnotek(),
    );
  }
}

class addnotek extends StatefulWidget {
  @override
  State<addnotek> createState() => _addnotekState();
}

class _addnotekState extends State<addnotek> {
  TextEditingController karyawan = TextEditingController();
  TextEditingController keperluan = TextEditingController();
  TextEditingController tujuan = TextEditingController();
  TextEditingController berangkat = TextEditingController();
  TextEditingController pulang = TextEditingController();
  TextEditingController driver = TextEditingController();
  TextEditingController kendaraan = TextEditingController();
  TextEditingController start = TextEditingController();
  TextEditingController acchead = TextEditingController();
  TextEditingController accpjk= TextEditingController();
  TextEditingController accgam = TextEditingController();

  String date = DateTime.now().toIso8601String();  

  CollectionReference kar = FirebaseFirestore.instance.collection('karyawan production');
  CollectionReference dvs = FirebaseFirestore.instance.collection('divisi production');

  var section = [
    'Forming',
    'Press',
    'Maintenance',
    'Injection',
  ];
  var _currentItemSelected = "Forming";
  var bagian = "Forming";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              centerTitle: true,
              title: RichText(text: TextSpan(
                text: "TUGAS LUAR PRODUCTION",
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
                            builder: (context) => Roleprod()
                          )
                  );
              } ,
              )
            ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: 
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Bagian : ",
                              style: TextStyle(
                                fontSize: 15,),
                            ),
                            DropdownButton<String>(
                              dropdownColor: Colors.grey,
                              isDense: true,
                              isExpanded: false,
                              focusColor: Colors.white,
                              items: section.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(
                                    dropDownStringItem,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                setState(() {
                                  _currentItemSelected = newValueSelected!;
                                  bagian : newValueSelected;
                                });
                              },
                              value: _currentItemSelected,
                            ),
                          ],
                        ),
                SizedBox(
                  height: 10,
                ), 
                TextFormField(
                        controller: karyawan,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Karyawan',
                          enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length == 0) {
                                return "Cannot be empty";
                              }else {
                                return null;
                              }
                            },
                            onChanged: (value) {},
                          ),
                        
                SizedBox(
                  height: 10,
                ), 
                      TextFormField(
                        controller: keperluan,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Keperluan',
                          enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length == 0) {
                                return "Cannot be empty";
                              }else {
                                return null;
                              }
                            },
                            onChanged: (value) {},
                          ),
                        
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                        controller: tujuan,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'Tujuan',
                          enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length == 0) {
                                return "Cannot be empty";
                              }else {
                                return null;
                              }
                            },
                            onChanged: (value) {},
                          ),
                        
                SizedBox(
                  height: 30,
                ), 
                Container(
                  margin: EdgeInsets.only(right: 215),
                  child: Text('Jadwal keberangkatan',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color (0xff000000),
                  ),
                ),
                ),
                      TextFormField(
                        controller: berangkat,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'ex: 01 Jan 2022 07:00',
                          enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                            ),
                           validator: (value) {
                              if (value!.length == 0) {
                                return "Cannot be empty";
                              }else {
                                return null;
                              }
                            },
                            onChanged: (value) {},
                          ),
                        
                SizedBox(
                  height: 10,
                ), 
                Container(
                  margin: EdgeInsets.only(right: 250),
                  child: Text('Perkiraan kembali',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color (0xff000000),
                    ),
                  ),
                ),
                      TextFormField(
                        controller: pulang,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: 'ex: 01 Jan 2022 18:00',
                          enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length == 0) {
                                return "Cannot be empty";
                              }else {
                                return null;
                              }
                            },
                            onChanged: (value) {},
                          ),
                      
                SizedBox(
                  height: 30,
                ),
                Center( 
                child: SizedBox(
                  height: 40,
                  width: 400,
                  child: MaterialButton(
                    onPressed: () {
                      kar.add({
                        'bagian': bagian,
                        'karyawan': karyawan.text,
                        'keperluan': keperluan.text,
                        'tujuan': tujuan.text,
                        'keberangkatan': berangkat.text,
                        'perkiraan kembali': pulang.text,
                        'driver' : driver.text,
                        'kendaraan' : kendaraan.text,
                        'acchead' : acchead.text,
                        'accpjk' : accpjk.text,
                        'accgam' : accgam.text,
                        'start' : start.text,
                        'getTime': date,
                        'timeposthead' : DateFormat.yMd().add_jm().format(DateTime.parse(date)) 
                      }).whenComplete(() {
                        dvs.add({
                        'bagian': bagian,
                        'karyawan': karyawan.text,
                        'keperluan': keperluan.text,
                        'tujuan': tujuan.text,
                        'keberangkatan': berangkat.text,
                        'perkiraan kembali': pulang.text,
                        'driver' : driver.text,
                        'kendaraan' : kendaraan.text,
                        'acchead' : acchead.text,
                        'accpjk' : accpjk.text,
                        'accgam' : accgam.text,
                        'start' : start.text,
                        'getTime': date,
                        'timeposthead' : DateFormat.yMd().add_jm().format(DateTime.parse(date)) 
                      });
                      }).whenComplete(() {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => Menuprod()));
                      });
                    },
                    color:  Color(0xff293535),
                    child: Text(
                      "BUAT JADWAL",
                       style: TextStyle(
                          fontSize: 12,
                          color: Colors.white
                        ),
                    )
                  )
                )
                ),
              
      ]))]),
          )));
          




      
  }
}