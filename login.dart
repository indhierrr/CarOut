

import 'package:carout/Driver/MenuDriver.dart';
import 'package:carout/Gam/MenuGam.dart';
import 'package:carout/Head/HASS/MenuHASS.dart';
import 'package:carout/Head/HENG/MenuHENG.dart';
import 'package:carout/Head/HPPIC/MenuHPPIC.dart';
import 'package:carout/Head/HPROD/MenuHPROD.dart';
import 'package:carout/Head/HQC/MenuHQC.dart';
import 'package:carout/Karyawan/ADM/Menukaryawan.dart';
import 'package:carout/Karyawan/ASS/Menukaryawan.dart';
import 'package:carout/Karyawan/ENG/Menukaryawan.dart';
import 'package:carout/Karyawan/PPIC/Menukaryawan.dart';
import 'package:carout/Karyawan/PROD/Menukaryawan.dart';
import 'package:carout/Karyawan/QC/Menukaryawan.dart';
import 'package:carout/Pjk/MenuPjk.dart';
import 'package:carout/register.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff293535),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xff293535),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 175
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color (0xffffffff),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 40.0,right: 
                           40.0),
                           height: 60.0,
                           width: 280,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Email',
                              enabled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              if (value!.length == 0) {
                                return "Email cannot be empty";
                              }
                              if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Please enter a valid email");
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              emailController.text = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 60.0,
                          width: 280,
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: _isObscure3,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure3
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure3 = !_isObscure3;
                                    });
                                  }),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                              enabled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 40.0,right: 
                            40),
                          width: 280,
                          height: 50,
                          child: SizedBox(
                            child: MaterialButton(
                              onPressed: () {
                            setState(() {
                              visible = true;
                            });
                            signIn(
                                emailController.text, passwordController.text);
                          },
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white
                                ),
                              ),
                              color: Color(0xff556E68),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text('Belum memiliki akun?',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top:2),
                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                      MaterialPageRoute(
                                        builder: (context) => Register()
                                      )
                                  );
                
                                 }, 
              
                                  child: Text(
                                    "Buat akun baru",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      decoration:TextDecoration.underline,
                                      color: Colors.white
                                    ),
                                  ),
                              ))),
                        Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: visible,
                            child: Container(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            ))),
                      ]
                    )
                  )
                )
              )
            ),
          ]
        )
      )
    );
  }
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Driver") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  MenuDriver(),
          ),
        );
        }
        else if (documentSnapshot.get('rool') == "Adminitration") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  MenuAdm(),
          )
          );
        }else if (documentSnapshot.get('rool') == "Assembly") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  MenuAss(),
          )
          );
        }else if (documentSnapshot.get('rool') == "PPIC") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  Menuppic(),
          )
          );
        }else if (documentSnapshot.get('rool') == "Production") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  Menuprod(),
          )
          );
        }else if (documentSnapshot.get('rool') == "QA") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  Menuqc(),
          )
          );
        }
        else if (documentSnapshot.get('rool') == "Assembly Head") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  MenuHASS(),
          )
          );
        }
        else if (documentSnapshot.get('rool') == "PPIC Head") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  MenuHPPIC(),
          )
          );
        }
        else if (documentSnapshot.get('rool') == "Production Head") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  MenuHPROD(),
          )
          );
        }
        else if (documentSnapshot.get('rool') == "QA Head") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  MenuHQC(),
          )
          );
        }
        else if (documentSnapshot.get('rool') == "TDD Head") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  MenuHENG(),
          )
          );
        }
        else if (documentSnapshot.get('rool') == "TDD") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  Menueng(),
          )
          );
        }
        else if (documentSnapshot.get('rool') == "Penanggungjawab Kendaraan") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  MenuPjk(),
          )
          );
        }
        else if (documentSnapshot.get('rool') == "DGM Adm") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  MenuGam(),
          )
          );
        }
      } else {
        AlertDialog(
          title: Text('Akun tidak terdaftar'),
          actions: [
            TextButton(onPressed: (){}, child: Text('OK'))
          ],
        );
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}