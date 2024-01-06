// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:convert';
// ignore: unnecessary_import
import 'dart:ui';
import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'contact_shop_detial.dart';

// ignore: camel_case_types
class shops extends StatefulWidget {
  const shops({Key? key}) : super(key: key);

  @override
  State<shops> createState() => _shopsState();
}

List comp = [];
// ignore: non_constant_identifier_names
Future<String> ListCompany() async {
  var url = 'https://dtechthailand.com/appbase/shop.php';

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
class _shopsState extends State<shops> {
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
                            leading: Image.asset(
                              "icons/maps.gif",
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
                                    "${comp[index]['address']}",
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
                                        Icons.phone_android_sharp,
                                        size: 15,
                                        color: Colors.grey.shade400,
                                      ),
                                      Text(
                                        "${comp[index]['tel']}",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey.shade400),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                            trailing: InkWell(
                              child: Icon(
                                Icons.arrow_circle_right_outlined,
                                size: 30,
                                color: kPrimaryColor,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    // ignore: prefer_const_constructors
                                    builder: (context) => shopdetial(
                                      id: comp[index]['id'],
                                      name: comp[index]['name'],
                                      address: comp[index]['address'],
                                      tel: comp[index]['tel'],
                                      works: comp[index]['works'],
                                      lat: comp[index]['lat'],
                                      lng: comp[index]['lng'],
                                      sho: comp[index]['sho'],
                                    ),
                                  ));
                            },
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
