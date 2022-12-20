// ignore_for_file: prefer_const_constructors

import 'package:carout/login.dart';
import 'package:carout/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: duplicate_ignore
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 5)),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Splash();
        }else{
        return MaterialApp(
          home: Login(),
        );

        }
      }
    );
  }
}
