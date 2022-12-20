
import 'package:carout/Karyawan/PROD/Menukaryawan.dart';
import 'package:carout/Karyawan/PROD/tab/gam.dart';
import 'package:carout/Karyawan/PROD/tab/head.dart';
import 'package:carout/Karyawan/PROD/tab/jalan.dart';
import 'package:carout/Karyawan/PROD/tab/pjk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class Statusprod extends StatelessWidget {
  const Statusprod({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
                centerTitle: true,
                title: RichText(text: TextSpan(
                  text: "STATUS PERIZINAN",
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
                              builder: (context) => Menuprod()
                            )
                    );
                } ,
                ),
               bottom: TabBar(tabs: 
                    [
                      Tab(
                        icon: Icon(
                          Icons.person, 
                          color: Colors.white,
                        ),
                        text: 'Head',
                      ),
                      Tab(
                        icon: Icon(
                          Icons.person, 
                          color: Colors.white,
                        ),
                        text: 'GA',
                      ),
                      Tab(
                        icon: Icon(
                          Icons.person, 
                          color: Colors.white,
                        ),
                        text: 'DGM Adm',
                      ),
                      Tab(
                        icon: Icon(
                          Icons.person, 
                          color: Colors.white,
                        ),
                        text: 'Driver', 
                      ),
                    ]
                  ),
              ),
              body: Column(
                children: [
                  
                  Expanded(
                    child: TabBarView(children: [
                      headprod(),
                      pjkprod(),
                      gamprod(),
                      jalanprod(),
                    ]),
                  )
                ],
              ),
      ),
    );
  }
}