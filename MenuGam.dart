import 'package:carout/Gam/perizinan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login.dart';


class MenuGam extends StatelessWidget {
  const MenuGam({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Perusahaan' ,
      theme: ThemeData(),
      home: DetailMenu(),
    );
  }
}


class DetailMenu extends StatelessWidget {
  const DetailMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: RichText(text: TextSpan(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextSpan(
              text: "Selamat datang",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ]
        ),),

        actions: [
          GestureDetector(
            onTap: (){
              logout(context);
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              width: 25,
              height: 25,
              child: Image.asset(
                "images/logout.png", 
                fit: BoxFit.contain,
              )
            ),
          ),
        ] ,

        backgroundColor: Color(0xff293535),

      ),

      body: Stack(
        children: [
          ClipPath(
            
            clipper: ClipPathClass(),
            child: Container(
              height: 250,
              width: Get.width,
              color: Color(0xff293535),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20,),
            child: Column(
              children: [
                Container(
                    height: Get.height*0.35,
                    //color: Colors.green,
                    child: Column(
                      children: [
                        ClipPath(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.symmetric(horizontal:25),
                            height: 260,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff222C2C),
                                Color(0xff344541),  
                              ]
                                        
                              )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                

                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "PT. TOSO Industry Indonesia",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "DGM Adminitration",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                
                              ],
                            )
                          ),
                        )
                      ],
                    )
                  ),
                
                Container(
                  height: 7,
                  color: Colors.grey[200],
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    //color: Colors.purple,
                    child: ListView(
                         children: [
                        SizedBox(height: 20,),
                        
                        Text(
                          
                          "    Daftar Menu",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                        SizedBox(height: 10),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed:(){
                                Navigator.push(
                                  context,
                                        // DetailPage adalah halaman yang dituju 
                                        MaterialPageRoute(
                                          builder: (context) => perizinangam()
                                        )
                                 );
                              },  
                              child: CardFolder(
                              icon: Image.asset('images/izin.png'),
                              title: "Perizinan", 
                              desc: 'Menunggu perizinan tugas luar',
                              ),
                            ),
                            TextButton(
                              onPressed:(){
                                
                              },  
                              child: CardFolder(
                              icon: Image.asset('images/profile.png'),
                              title: "Notifikasi", 
                              desc: 'Lihat notifikasi',
                              ),
                            ),
                          ],
                         ),
                       ),
                        
                      ],
                    ),
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }
class CardFolder extends StatelessWidget {
  const CardFolder({
    Key? key,
    required this.title,
    required this.desc,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String desc;
  final Image icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: Get.width*0.4,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xffE5E5E5),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: icon,
              width: 40,
              height: 40,
              //color: Colors.amber,
            ),
            SizedBox(height: 10,),
            Text(title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),),
            SizedBox(height: 5,),
            Text(desc,
            style: TextStyle(
              fontSize: 11,
              color: Colors.black
           ),)
          ],
      ),
      
        
    );
  }
}


class ClipPathClass extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    Path path=Path();
    path.lineTo(0, size.height-60);
    path.quadraticBezierTo(
      size.width/2, 
      size.height, 
      size.width,
      size.height-60
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
  
}