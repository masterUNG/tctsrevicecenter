// ignore_for_file: prefer_const_constructors, deprecated_member_use

// ignore: unnecessary_import
import 'dart:ui';

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:path/path.dart';
// ignore: unused_import
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types, must_be_immutable
class promodesc extends StatefulWidget {
  String imga, title, price, des, urls;
  promodesc(
      {Key? key,
      required this.imga,
      required this.title,
      required this.price,
      required this.des,
      required this.urls})
      : super(key: key);

  @override
  State<promodesc> createState() => _promodescState();
}

// ignore: camel_case_types
class _promodescState extends State<promodesc> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        // ignore: prefer_const_constructors
        title: Text(
          "สินค้ามาใหม่แนะนำ",
          style: kTextApp,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              "images/tctlogo.png",
              width: 50,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: size.height * 0.3),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, -3))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          child: Image.network(
                            // ignore: prefer_interpolation_to_compose_strings
                            "https://dtechthailand.com/appwatashi/_img/promotion/" +
                                widget.imga,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "ราคา " +
                                  NumberFormat("###,##0.00")
                                      .format(double.parse(widget.price)) +
                                  " บาท",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Expanded(
                          child: Text(
                            widget.des,
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // ignore: sized_box_for_whitespace
      bottomNavigationBar: Container(
        height: 65,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  String googleUrl = widget.urls;
                  launch(googleUrl);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  height: 65,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(
                            Icons.shopping_cart_checkout,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text(
                            "สั่งซื้อสินค้า",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
