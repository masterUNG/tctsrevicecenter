// ignore: unused_import
import 'package:tctservicecenter/constants.dart';
import 'package:tctservicecenter/scan.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'warrantysearch.dart';
import 'warantytext.dart';
// ignore: unused_import

// ignore: import_of_legacy_library_into_null_safe

// ignore: camel_case_types
class pagewarranty extends StatefulWidget {
  const pagewarranty({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _pagewarrantyState createState() => _pagewarrantyState();
}

// ignore: camel_case_types
class _pagewarrantyState extends State<pagewarranty> {
  // ignore: non_constant_identifier_names
  late String ScanQr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'เงื่อนไขการรับประกัน',
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

        // actions: [
        //   // ignore: prefer_const_constructors
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => const warrantySearchs(),
        //             ));
        //       },
        //       icon: const Icon(Icons.arrow_forward))
        // ],
        elevation: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: const Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: wartext(),
      ),
      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                // ignore: prefer_const_constructors
                builder: (context) => Myscan(),
              ));
        },
        label: const Text(
          "ตรวจประกัน",
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        icon: const Icon(
          Icons.qr_code,
          size: 20,
        ),
      ),
    );
  }
}
