// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, duplicate_ignore, sort_child_properties_last

import 'dart:convert';
// ignore: unnecessary_import
import 'dart:ui';

import 'package:tctservicecenter/constants.dart';
// ignore: unused_import
import 'package:tctservicecenter/contact.dart';
// ignore: unnecessary_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable, camel_case_types
class srepare extends StatefulWidget {
  String search;
  srepare({Key? key, required this.search}) : super(key: key);

  @override
  State<srepare> createState() => _srepareState();
}

// ignore: camel_case_types
class _srepareState extends State<srepare> {
  List rep = [];
  Future<String> repairs() async {
    // ignore: prefer_interpolation_to_compose_strings
    var url =
        'https://dtechthailand.com/appbase/repair.php?search=' + widget.search;
    var responese = await http.get(Uri.parse(url));
    // ignore: avoid_print
    if (responese.statusCode == 200) {
      rep = json.decode(responese.body);
    }
    // for (var u in promo) }
    //   getData.add(Note.fromJson(u));
    // }
    return rep.toString();
    // ignore: avoid_print
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: false,
        title: Text(
          "ข้อมูลการซ่อม",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
      body: Container(
        color: Colors.grey.shade200,
        child: FutureBuilder(
          future: repairs(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                child: ListView.builder(
                  itemCount: rep.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = rep[index];

                    return data['sho'] == 'n'
                        ? statusN(index)
                        : statusYes(data);
                  },
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Container statusN(int index) {
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("images/94900-error.gif"),
                Positioned(
                    bottom: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "ไม่พบข้อมูลสินค้าส่งซ่อม",
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        const Text(
                          "(No data found in the search.)",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding statusYes(data) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "วันรับสินค้า",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['orderdate'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "สถานะ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['status'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "ประเภทสินค้า",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['types'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "แบรนด์",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['brand'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "ประกัน",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['war'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "ผู้จัดทำ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['names'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "เลขที่ส่งซ่อม",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['tickid'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "ซีเรียว",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['sn'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "รหัสสินค้า",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['sku'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "รายละเอียด",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['sku_des'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "ปัญหาเบื่องต้น",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['accident'],
                            style: TextStyle(fontSize: 10, color: Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "ปัญหาที่เจอ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['remark2'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              "วิธีแก้ไข",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(10),
                          //   bottomLeft: Radius.circular(10),
                          // ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, top: 2, right: 2, bottom: 2),
                          child: Text(
                            data['remark3'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}
