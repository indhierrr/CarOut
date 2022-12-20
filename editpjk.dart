
import 'package:carout/Karyawan/PROD/status.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class editpjkprod extends StatefulWidget {
  DocumentSnapshot docid;
  editpjkprod({required this.docid});

  @override
  _editpjkprodState createState() => _editpjkprodState();
}

class _editpjkprodState extends State<editpjkprod> {
 TextEditingController bagian = TextEditingController();
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
                            builder: (context) => Statusprod()
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
                        margin: EdgeInsets.only(right: 275),
                        child: Text(
                        'Jadwal Keberangkatan',
                        style: TextStyle(fontSize: 10,color: Color(0xff556E68)
                        ),
                      ),),

                      
                        
                        Container(
                          child: TextFormField(
                            controller:berangkat,
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
                            controller:pulang,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,hintText: 'Perkiraan kembali',
                            ),
                          ),
                          
                        ),
                      Container(
                        margin: EdgeInsets.only(right: 335),
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