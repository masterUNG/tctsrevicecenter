import 'package:location/location.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';
// ignore: unused_import
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// ignore: unused_import
import 'constants.dart';
// ignore: unused_import

// ignore: unused_import
import 'phone.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';
// ignore: unused_import

import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TCT Service Center',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        //primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // ignore: prefer_const_constructors
      // SplashScreen()

      home: const SplashScreen(),
    );
  }
}
