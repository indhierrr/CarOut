
import 'package:carout/Karyawan/PROD/Menukaryawan.dart';
import 'package:carout/Karyawan/PROD/addtugas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';




class Roleprod extends StatelessWidget {
  const Roleprod ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Driver' ,
      theme: ThemeData(),
      home: DetailScreen(),
    );
}
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: RichText(text: TextSpan(
                text: "PILIH DIVISI",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff293535),
                  fontWeight: FontWeight.bold
                ),
              ),),
              leading: GestureDetector(
              child: Icon( Icons.arrow_back_ios, color: Color(0xff293535),  ),
              onTap: () {
                Navigator.push(
                    context,
                          // DetailPage adalah halaman yang dituju 
                          MaterialPageRoute(
                            builder: (context) => Menuprod()
                          )
                  );
              } ,
              )
            ),
      body: ListView(
                         children: [
                        SizedBox(height: 20,),
                        
                        Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed:(){
                                
                              },  
                              child: CardFolder(
                              icon: Image.asset('images/lihat.png'),
                              title: "Adminitration", 
                              desc: 'GA, Accounting, Finance, HSQE, Purchasing',
                              ),
                            ),
                            TextButton(
                              onPressed:(){
                               
                              },  
                              child: CardFolder(
                              icon: Image.asset('images/lihat.png'),
                              title: "Assembly", 
                              desc: '1st Assembly, 2nd Assembly, 3rd Assembly',
                              ),
                            ),
                          ],
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
                               
                              },  
                              child: CardFolder(
                              icon: Image.asset('images/lihat.png'),
                              title: "TDD", 
                              desc: 'TDD',
                              ),
                            ),
                            TextButton(
                              onPressed:(){
                                
                              },  
                              child: CardFolder(
                              icon: Image.asset('images/lihat.png'),
                              title: "PPIC", 
                              desc: 'PPC, Warehouse',
                              ),
                            ),
                          ],
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
                                          builder: (context) => Addprod()
                                        )
                                 );
                              },  
                              child: CardFolder(
                              icon: Image.asset('images/lihat.png'),
                              title: "Production", 
                              desc: 'Forming, Press, Maintenance, Injection',
                              ),
                            ),
                            TextButton(
                              onPressed:(){
                                
                              },  
                              child: CardFolder(
                              icon: Image.asset('images/lihat.png'),
                              title: "Quality Assurance", 
                              desc: 'QA,QC',
                              ),
                            ),
                          ],
                         ),
                       ),
                        SizedBox(height: 10),
                        
                       
                      ],
                    ),
                  );
                
              
            
          
  }
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