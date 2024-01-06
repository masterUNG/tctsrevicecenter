// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:async';

import 'package:tctservicecenter/constants.dart';
import 'package:tctservicecenter/repair/repairsort.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(const ScanRepairs());

class ScanRepairs extends StatefulWidget {
  const ScanRepairs({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScanRepairsState createState() => _ScanRepairsState();
}

class _ScanRepairsState extends State<ScanRepairs> {
  // ignore: unused_field
  String _scanBarcode = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        // ignore: avoid_print
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // ignore: avoid_print
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      // ignore: avoid_print
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      if (barcodeScanRes != '-1') {
        //Dig(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => srepare(search: _scanBarcode)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              title: const Text(
                'ตรวจสอบสินค้าส่งซ่อม',
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
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(color: Colors.white),
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // ignore: prefer_const_constructors
                        Text(
                          "สแกนเลขที่ใบส่งซ่อม,ซีเรียลผลิตภัณฑ์",
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor),
                        ),
                        // ignore: prefer_const_constructors
                        Text(
                          "(Scan the repair number or the serial number )",
                          style: const TextStyle(
                              color: kPrimaryColor, fontSize: 12),
                        ),

                        Container(
                          // ignore: prefer_const_constructors
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          alignment: Alignment.center,
                          width: 250,

                          child: Image.asset("images/scan.gif"),
                        ),
                        ElevatedButton.icon(
                          label: const Text('Scanning....'),
                          icon: const Icon(Icons.qr_code),
                          onPressed: () {
                            scanBarcodeNormal();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              // ignore: deprecated_member_use
                              primary: kPrimaryColor,
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton.icon(
                          label: const Text(
                            'Search input',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                          icon: const Icon(
                            Icons.input,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            createAlert(context);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              // ignore: deprecated_member_use
                              primary: kBackgroundColor,
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20)),
                        ),
                        // ElevatedButton.icon(
                        //   label: Text('Scan QR'),
                        //   icon: Icon(Icons.qr_code),
                        //   onPressed: () {
                        //     scanQR();
                        //   },
                        // ),
                        // ElevatedButton.icon(
                        //   label: Text('Scan Stream'),
                        //   icon: Icon(Icons.qr_code),
                        //   onPressed: () {
                        //     startBarcodeScanStream();
                        //   },
                        // ),
                      ]));
            })));
  }

  createAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                side: BorderSide(
                    width: 2, color: kBackgroundColor.withOpacity(0.3))),
            backgroundColor: kPrimaryColor,
            title: const Text(
              "ค้นหาซีเรียล,เลขที่ส่งซ่อม",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            content: Kef(),
          );
        });
  }

  // ignore: non_constant_identifier_names
  Widget Kef() {
    // ignore: no_leading_underscores_for_local_identifiers
    TextEditingController _textController = TextEditingController();
    // ignore: sized_box_for_whitespace
    return Container(
      height: 130,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                    color: kPrimaryColor.withOpacity(0.8), width: 2)),
            child: TextFormField(
              controller: _textController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'ซีเรียล,เลขที่ส่งซ่อม',
                  // ignore: prefer_const_constructors
                  hintStyle: TextStyle(
                      fontSize: 12, color: kPrimaryColor.withOpacity(0.4)),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _textController.clear();
                        });
                      },
                      icon: const Icon(
                        Icons.close,
                        color: kPrimaryColor,
                      ))),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "ยกเลิก",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "ตกลง",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  srepare(search: _textController.text)));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  // // ignore: non_constant_identifier_names
  // Future<dynamic> Dig(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: const [
  //               Text(
  //                 "กรอกหมายเลขซีเรียล",
  //                 style:
  //                     TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
  //               ),
  //             ],
  //           ),
  //           content: Container(
  //             height: 50,
  //             decoration: const BoxDecoration(
  //               color: kBackgroundColor,
  //             ),
  //             child: const TextField(
  //               controller: _textController,
  //               decoration: InputDecoration(
  //                 hintText: "กรอกที่นี่",
  //                 labelText: "Serial Text",
  //                 labelStyle: TextStyle(
  //                   fontSize: 15,
  //                   color: kPrimaryColor,
  //                 ),
  //                 border: OutlineInputBorder(),
  //                 suffixIcon: Icon(Icons.search),
  //               ),
  //             ),
  //           ),
  //           actions: <Widget>[
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text("ยกเลิก"),
  //                   style: ElevatedButton.styleFrom(
  //                       primary: Colors.red,
  //                       // ignore: prefer_const_constructors
  //                       textStyle: TextStyle(
  //                         fontSize: 16,
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold,
  //                       )),
  //                 ),
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text("ตกลง"),
  //                   style: ElevatedButton.styleFrom(
  //                       primary: Colors.green,
  //                       // ignore: prefer_const_constructors
  //                       textStyle: TextStyle(
  //                         fontSize: 16,
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold,
  //                       )),
  //                 )
  //               ],
  //             )
  //           ],
  //         );
  //       });
  // }
}
