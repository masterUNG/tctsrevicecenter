// ignore_for_file: camel_case_types, deprecated_member_use, duplicate_ignore
// ignore: unnecessary_import
import 'dart:ui';

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

class phoneCall extends StatefulWidget {
  const phoneCall({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _phoneCallState createState() => _phoneCallState();
}

class _phoneCallState extends State<phoneCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: pageLoad(),
    );
  }

  Container pageLoad() {
    return Container(
      color: kPrimaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: Center(
              child: Image.asset(
                'images/logocall.png',
                height: 320,
              ),
            ),
          ),
          Container(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.only(top: 20),
            // ignore: duplicate_ignore, duplicate_ignore
            child: Center(
              // ignore: duplicate_ignore, duplicate_ignore
              child: ElevatedButton(
                // ignore: duplicate_ignore, duplicate_ignore
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    primary: const Color.fromRGBO(213, 18, 33, 1),
                    // ignore: deprecated_member_use
                    onPrimary: Colors.white),
                onPressed: () {
                  launch('tel:1795');
                },
                child: const Text(
                  "โทรหาฉัน 1795",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
