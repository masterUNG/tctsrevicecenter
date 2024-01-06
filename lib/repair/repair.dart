// ignore: unused_import
import 'dart:ui';

import 'package:tctservicecenter/constants.dart';
import 'package:tctservicecenter/repair/hik.dart';
import 'package:tctservicecenter/repair/scanrepair.dart';
import 'package:tctservicecenter/repair/watashi.dart';
import 'package:tctservicecenter/repair/dahua.dart';
import 'package:tctservicecenter/repair/zk.dart';
import 'package:flutter/material.dart';

import 'hilook.dart';

// ignore: camel_case_types
class repairs extends StatefulWidget {
  const repairs({Key? key}) : super(key: key);

  @override
  State<repairs> createState() => _repairsState();
}

// ignore: camel_case_types
class _repairsState extends State<repairs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors

          // ignore: prefer_const_constructors
          bottom: TabBar(
            isScrollable: true,
            tabs: const [
              Tab(
                text: "WATASHI",
              ),
              Tab(
                text: "HIKVISION",
              ),
              Tab(
                text: "DAHUA",
              ),
              Tab(
                text: "HILOOK",
              ),
              Tab(
                text: "ZK",
              ),
            ],
          ),
          title: const Text(
            'เงื่อนไขการส่งซ่อมผลิตภัณฑ์',
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
          backgroundColor: kPrimaryColor,
          centerTitle: false,
          elevation: 0,
        ),
        body: const TabBarView(
          children: [
            watashis(),
            hiks(),
            dahuas(),
            hilooks(),
            zks(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  // ignore: prefer_const_constructors
                  builder: (context) => ScanRepairs(),
                ));
          },
          label: const Text(
            "ตรวจของซ่อม",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          icon: const Icon(
            Icons.qr_code,
            size: 20,
          ),
        ),
      ),
    );
  }
}
