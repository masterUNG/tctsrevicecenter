// ignore: unused_import
import 'dart:async';

// ignore: unused_import

import 'package:flutter/material.dart';

import 'menu/menu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState

    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            // ignore: prefer_const_constructors
            context,
            // ignore: prefer_const_constructors

            MaterialPageRoute(builder: (context) => const Menus())));

    // const MyHomePage(title: 'Watashi Service Center'))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      color: Colors.black,
      child: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/home.png',
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ],
          ),
          // ignore: prefer_const_constructors
          Positioned(
            top: 430,
            left: 0,
            right: 0,
            // ignore: prefer_const_constructors
            child: Center(
              // ignore: prefer_const_constructors
              child: CircularProgressIndicator(
                // ignore: unnecessary_const, prefer_const_constructors
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
