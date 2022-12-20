import 'package:carout/Head/HPROD/MenuHPROD.dart';
import 'package:carout/Head/HPROD/perizinan.dart';
import 'package:carout/Karyawan/PROD/Menukaryawan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class perizinanedithprod extends StatefulWidget {
  DocumentSnapshot docid;
  perizinanedithprod({required this.docid});

  @override
  _perizinanedithprodState createState() => _perizinanedithprodState();
}

class _perizinanedithprodState extends State<perizinanedithprod> {
  TextEditingController karyawan = TextEditingController();
  TextEditingController keperluan = TextEditingController();
  TextEditingController tujuan = TextEditingController();
  TextEditingController berangkat = TextEditingController();
  TextEditingController pulang = TextEditingController();
  TextEditingController driver = TextEditingController();
  TextEditingController kendaraan = TextEditingController();
  TextEditingController start = TextEditingController();
  TextEditingController bagian = TextEditingController();
  
  TextEditingController accpjk= TextEditingController();
  TextEditingController accgam = TextEditingController();

  TextEditingController keterangan = TextEditingController();

  String date = DateTime.now().toIso8601String(); 

  CollectionReference dvs = FirebaseFirestore.instance.collection('divisi');
  CollectionReference noacchead = FirebaseFirestore.instance.collection('tugas luar no head');

  CollectionReference pjk = FirebaseFirestore.instance.collection('pjk');
  
  var options = [
    'Umar Syarif',
    'Pujianto',
  ];
  var _currentItemSelected = "Umar Syarif";
  var acchead = "Umar Syarif";


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
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),),
              backgroundColor: Color(0xff293535),
              leading: GestureDetector(
              child: Icon( Icons.arrow_back_ios, color: Colors.white,  ),
              onTap: () {
                Navigator.push(
                    context,
                          // DetailPage adalah halaman yang dituju 
                          MaterialPageRoute(
                            builder: (context) => perizinanhprod()
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
                        margin: EdgeInsets.only(right: 355),
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
                        SizedBox(
                        height: 10,
                      ),
                      Container(
                  height: 2,
                  color:  Color(0xff293535),
                ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Manager/DGM/GM/Direktur',
                        style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold),
                      ),
                     SizedBox(
                        height: 20,
                      ), 
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Nama : ",
                              style: TextStyle(
                                fontSize: 15,),
                            ),
                            DropdownButton<String>(
                              dropdownColor: Colors.grey,
                              isDense: true,
                              isExpanded: false,
                              focusColor: Colors.white,
                              items: options.map((String dropDownStringItem) {
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
                                  acchead : newValueSelected;
                                });
                              },
                              value: _currentItemSelected,
                            ),
                          ],
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      Center( 
                        child: SizedBox(
                          height: 40,
                          width: 400,
                          child: MaterialButton(
                            onPressed: () {
                          dvs.add({
                          'bagian': bagian.text,
                        'karyawan': karyawan.text,
                        'keperluan': keperluan.text,
                        'tujuan': tujuan.text,
                        'keberangkatan': berangkat.text,
                        'perkiraan kembali': pulang.text,
                        'driver' : driver.text,
                        'kendaraan' : kendaraan.text,
                        'acchead' : acchead,
                        'accpjk' : accpjk.text,
                        'accgam' : accgam.text,
                        'start' : start.text,
                        'getTime': date,
                        'timeposthead' : DateFormat.yMd().add_jm().format(DateTime.parse(date)) 
                      }
                        ).whenComplete(() {
                        pjk.add({
                        'bagian': bagian.text,
                        'karyawan': karyawan.text,
                        'keperluan': keperluan.text,
                        'tujuan': tujuan.text,
                        'keberangkatan': berangkat.text,
                        'perkiraan kembali': pulang.text,
                        'driver' : driver.text,
                        'kendaraan' : kendaraan.text,
                        'acchead' : acchead,
                        'accpjk' : accpjk.text,
                        'accgam' : accgam.text,
                        'start' : start.text,
                        'getTime': date,
                        'timeposthead' : DateFormat.yMd().add_jm().format(DateTime.parse(date)) 
                      });
                      }).whenComplete(() {
                        widget.docid.reference.delete().whenComplete(() {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (_) => MenuHPROD()));
                      });});
                    },
                            color:  Color(0xff293535),
                            child: Text(
                              "MENYETUJUI",
                               style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white
                                ),
                            )
                          )
                        )
                        ),
                        SizedBox(
                        height: 20,
                      ),
                      Container(
                  height: 2,
                  color:  Color(0xff293535),
                ),
                SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Jika tidak menyetujui',
                        style: TextStyle(fontSize: 15,
                        fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: TextFormField(
                            controller: keterangan,
                             decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: 'Keterangan',
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
                        ),        
                        SizedBox(
                        height: 20,
                      ),
                      Center( 
                        child: SizedBox(
                          height: 40,
                          width: 400,
                          child: MaterialButton(
                            onPressed: () {
                            noacchead.add({
                          'bagian': bagian.text,
                          'karyawan': karyawan.text,
                          'keperluan': keperluan.text,
                          'tujuan': tujuan.text,
                          'keberangkatan': berangkat.text,
                          'perkiraan kembali': pulang.text,
                          'acchead': acchead,
                          'keterangan' : keterangan.text,
                          'getTime': date,
                        'timeposthead' : DateFormat.yMd().add_jm().format(DateTime.parse(date)) 
                      }
                        ).whenComplete(() {
                          widget.docid.reference.delete().whenComplete(() {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (_) => perizinanhprod()));
                        });
                        });
                      },
                            color:  Colors.grey,
                            child: Text(
                              "TIDAK MENYETUJUI",
                               style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff293535)
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