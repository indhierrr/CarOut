

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // ignore: prefer_const_constructors
        backgroundColor: Color(0xFFFFFFFF),
        body: Center(
          // ignore: sized_box_for_whitespace
          child: Container(
            width: Get.width *0.5,
            height: Get.width *0.5,
            child: Image.asset('images/logo.png'),
          ),
        ),
      ),
    );
  }
}