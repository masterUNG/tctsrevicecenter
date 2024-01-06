import 'dart:convert';
// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tctservicecenter/constants.dart';
import 'package:http/http.dart' as http;

class delivery_detail extends StatefulWidget {
  String search;
  delivery_detail({Key? key, required this.search}) : super(key: key);

  @override
  State<delivery_detail> createState() => _delivery_detailState();
}

class _delivery_detailState extends State<delivery_detail> {
  List po = [];

  // ignore: non_constant_identifier_names
  Future<String> getWar() async {
    // ignore: prefer_interpolation_to_compose_strings
    var url = 'https://dtechthailand.com//appbase/delivery.php?doc=' +
        widget.search.toUpperCase();
    var responese = await http.get(Uri.parse(url));
    // ignore: avoid_print
    if (responese.statusCode == 200) {
      po = json.decode(responese.body);
    }
    // for (var u in maplist) }
    //   getData.add(Note.fromJson(u));
    // }
    return po.toString();
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
          "ตรวจสอบสถานะสินค้า",
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
      body: Container(
        color: kBackgroundColor,
        child: FutureBuilder(
          future: getWar(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: po.length,
                itemBuilder: (BuildContext context, int index) {
                  // ignore: avoid_unnecessary_containers
                  return po[index]['step'].toString() != '0'
                      ? Dbody(index)
                      : no();
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

  Widget no() {
    return Container(
      child: Center(
        child: Text("ไม่พบข้อมูลที่ค้นหา"),
      ),
    );
  }

  Widget Dbody(int index) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            po[index]['doc'],
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Text("วันที่สั่งซื้อ : " + po[index]['oderdate'],
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              )),
          Text(po[index]['name']),
          SizedBox(
            height: 20,
          ),
          po[index]['doc'] != '' ? check1(index) : check1NONE(),
          po[index]['shipto'] != '' ? check2(index) : check2NONE(),
          po[index]['no'] != '' ? check3(index) : check3NONE(),
          po[index]['comp'] != null ? check4(index) : check4NONE(),
        ],
      ),
    );
  }

  Widget check1(int index) {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                  child: Icon(Icons.check), backgroundColor: Colors.green),
              title: Text('กำลังจัดเตียมสินค้า'),
              subtitle: Text(
                'จำนวน : ' + po[index]['amount'],
                style: const TextStyle(fontSize: 12, color: Colors.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget check1NONE() {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                  child: Icon(Icons.check), backgroundColor: Colors.redAccent),
              title: Text('กำลังจัดเตียมสินค้า'),
            ),
          ),
        ],
      ),
    );
  }

  Widget check2(int index) {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                  child: Icon(Icons.check), backgroundColor: Colors.green),
              title: Text('รอการจัดส่ง'),
              subtitle: Text(
                po[index]['shipto'],
                style: TextStyle(fontSize: 12, color: Colors.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget check2NONE() {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                  child: Icon(Icons.clear), backgroundColor: Colors.redAccent),
              title: Text('รอการจัดส่ง'),
            ),
          ),
        ],
      ),
    );
  }

  Widget check3(int index) {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                  child: Icon(Icons.check), backgroundColor: Colors.green),
              title: Text('กำลังจัดส่ง'),
              subtitle: Column(children: [
                Row(
                  children: [
                    Icon(
                      Icons.inventory_outlined,
                      size: 14,
                      color: Colors.orange,
                    ),
                    Text(" " + po[index]['no'],
                        style: TextStyle(fontSize: 12, color: Colors.orange))
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.car_crash_outlined,
                      size: 14,
                      color: Colors.orange,
                    ),
                    Text(" " + po[index]['car'],
                        style: TextStyle(fontSize: 12, color: Colors.orange))
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_outline_rounded,
                      size: 14,
                      color: Colors.orange,
                    ),
                    Text(" " + po[index]['drive'],
                        style: TextStyle(fontSize: 12, color: Colors.orange))
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.orange,
                    ),
                    Text(" " + po[index]['delivery'],
                        style: TextStyle(fontSize: 12, color: Colors.orange))
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget check3NONE() {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                  child: Icon(Icons.clear), backgroundColor: Colors.redAccent),
              title: Text('กำลังจัดส่ง'),
            ),
          ),
        ],
      ),
    );
  }

  Widget check4(int index) {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                  child: Icon(Icons.check), backgroundColor: Colors.green),
              title: Text('จัดส่งเรียบร้อย'),
              subtitle: Text(
                po[index]['agent'] + "เลขที่ขนส่ง : " + po[index]['tax'],
                style: TextStyle(fontSize: 12, color: Colors.orange),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget check4NONE() {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                  child: Icon(Icons.clear), backgroundColor: Colors.redAccent),
              title: Text('จัดส่งเรียบร้อย'),
            ),
          ),
        ],
      ),
    );
  }
}
