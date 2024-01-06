import 'dart:convert';
// ignore: unnecessary_import
import 'dart:ui';

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types, must_be_immutable
class swaranty extends StatefulWidget {
  String search;
  swaranty({Key? key, required this.search}) : super(key: key);

  @override
  State<swaranty> createState() => _swarantyState();
}

// ignore: camel_case_types
class _swarantyState extends State<swaranty> {
  List sn = [];

  // ignore: non_constant_identifier_names
  Future<String> getWar() async {
    // ignore: prefer_interpolation_to_compose_strings
    var url =
        'https://dtechthailand.com/appbase/sn.php?search=' + widget.search;
    var responese = await http.get(Uri.parse(url));
    // ignore: avoid_print
    if (responese.statusCode == 200) {
      sn = json.decode(responese.body);
    }
    // for (var u in maplist) }
    //   getData.add(Note.fromJson(u));
    // }
    return sn.toString();
    // ignore: avoid_print
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "รับประกันสินค้า",
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
      // ignore: avoid_unnecessary_containers
      body: Container(
        color: kPrimaryColor,
        child: FutureBuilder(
          future: getWar(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: sn.length,
                itemBuilder: (BuildContext context, int index) {
                  // ignore: avoid_unnecessary_containers
                  return sn[index]['status'] == 'y'
                      ? statusY(index)
                      : statusN(index);
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
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
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          "ไม่พบข้อมูลการรับประกัน",
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
                        Text(
                          widget.search,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
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

  Widget yes() {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(9.0), topLeft: Radius.circular(9.0)),
        color: Colors.green,
      ),
      child: const Center(
        child: Text(
          "ในประกัน",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget no() {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(9.0), topLeft: Radius.circular(9.0)),
        color: Colors.red,
      ),
      child: const Center(
        child: Text(
          "หมดประกัน",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Container statusY(int index) {
    // ignore: avoid_unnecessary_containers
    return Container(
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(color: kPrimaryColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: kBackgroundColor,
                  border: Border.all(color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      "สินค้าของท่านได้รับการประกันจาก",
                      style: const TextStyle(
                          fontSize: 12,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    // ignore: prefer_const_constructors
                    Text("บริษัท ทีซีที เอสเซสโซรี่ (สำนักงานใหญ่)",
                        style: const TextStyle(
                            fontSize: 12,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold)),
                    // ignore: prefer_const_constructors
                    Text(
                        "เลขที่ 3 ซอย พัฒนาการ 20 แยก 5 แขวง สวนหลวง แขวงสวนหลวง กรุงเทพมหานคร 10250",
                        style: const TextStyle(
                            fontSize: 12, color: kPrimaryColor)),
                  ],
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    if (sn[index]['war'] == 'อยู่ในประกัน') yes() else no(),
                    ListTile(
                      leading: const Icon(
                        Icons.check_box_outlined,
                        size: 30,
                        color: kPrimaryColor,
                      ),
                      title: const Text('ซีเรียลสินค้า :',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(sn[index]['SerialNo'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor)),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.check_box_outlined,
                        size: 30,
                        color: kPrimaryColor,
                      ),
                      title: const Text(
                        'รหัสสินค้า :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(sn[index]['GoodCode'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor)),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.check_box_outlined,
                        size: 30,
                        color: kPrimaryColor,
                      ),
                      title: const Text('รายละเอียด :',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(sn[index]['GoodName1'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor)),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.check_box_outlined,
                        size: 30,
                        color: kPrimaryColor,
                      ),
                      title: const Text('การรับประกัน :',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          sn[index]['wt'] + ' / ' + sn[index]['DefiLabel'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor)),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.check_box_outlined,
                        size: 30,
                        color: kPrimaryColor,
                      ),
                      title: const Text('แบรนด์ :',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(sn[index]['brand'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor)),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
