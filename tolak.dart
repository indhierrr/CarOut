
import 'package:carout/Karyawan/PROD/Menukaryawan.dart';
import 'package:carout/Karyawan/PROD/tab/tabtolak/gamtolak.dart';
import 'package:carout/Karyawan/PROD/tab/tabtolak/headtolak.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class Tolakprod extends StatelessWidget {
  const Tolakprod({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
                centerTitle: true,
                title: RichText(text: TextSpan(
                  text: "DIBATALKAN",
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
                        text: 'DGM Adm',
                      ),
                    ]
                  ),
              ),
              body: Column(
                children: [
                  
                  Expanded(
                    child: TabBarView(children: [
                      headtolakprod(),
                      gamtolakprod(),
                    ]),
                  )
                ],
              ),
      ),
    );
  }
}