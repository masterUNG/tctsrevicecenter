// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:convert';
// ignore: unnecessary_import
import 'dart:ui';
import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class contactcus extends StatefulWidget {
  const contactcus({Key? key}) : super(key: key);

  @override
  State<contactcus> createState() => _contactcusState();
}

List comp = [];
// ignore: non_constant_identifier_names
Future<String> ListCompany() async {
  var url = 'https://dtechthailand.com/appbase/company.php';

  var responese = await http.get(Uri.parse(url));
  // ignore: avoid_print
  if (responese.statusCode == 200) {
    comp = json.decode(responese.body);
  }
  // for (var u in promo) }
  //   getData.add(Note.fromJson(u));
  // }
  return comp.toString();
  // ignore: avoid_print
}

// ignore: camel_case_types
class _contactcusState extends State<contactcus> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Padding(
      padding: EdgeInsets.only(top: 3),
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: FutureBuilder(
            future: ListCompany(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // ignore: avoid_unnecessary_containers, duplicate_ignore
                return Container(
                  color: kBackgroundColor,
                  // ignore: prefer_const_constructors
                  child: ListView.builder(
                      itemCount: comp.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 0,
                          child: ListTile(
                            leading: Image.network(
                              comp[index]['logo'],
                              width: 45,
                            ),
                            title: Text(
                              comp[index]['name'],
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor),
                            ),
                            subtitle: Column(
                              children: [
                                // ignore: avoid_unnecessary_containers
                                Container(
                                  child: Text(
                                    "${comp[index]['address']} (Tax: ${comp[index]['taxid']})",
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                // ignore: avoid_unnecessary_containers
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.alarm_on_outlined,
                                        size: 15,
                                        color: Colors.red.withOpacity(0.8),
                                      ),
                                      Text(
                                        "${comp[index]['works']}",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.red.withOpacity(0.8)),
                                      )
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 3,
                                ),
                                // ignore: avoid_unnecessary_containers
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        size: 15,
                                        color: kPrimaryColor,
                                      ),
                                      Text(
                                        "${comp[index]['tel']}",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: kPrimaryColor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      "ผลิตภัณฑ์ที่ให้บริการ",
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black.withOpacity(0.8)),
                                    )
                                  ],
                                ),

                                Image.network(
                                  comp[index]['banner'],
                                  fit: BoxFit.fitWidth,
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                            isThreeLine: true,
                          ),
                        );
                      }),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
