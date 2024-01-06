// ignore_for_file: camel_case_types, prefer_const_constructors, duplicate_ignore

import 'dart:convert';

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:path/path.dart';

import '../news/newdetial.dart';

class avtivity extends StatefulWidget {
  const avtivity({Key? key}) : super(key: key);

  @override
  State<avtivity> createState() => _avtivityState();
}

class _avtivityState extends State<avtivity> {
  List avt = [];
  // ignore: non_constant_identifier_names
  Future<String> avtivitys() async {
    var url = 'https://dtechthailand.com/appbase/newshome.php';
    var responese = await http.get(Uri.parse(url));
    // ignore: avoid_print
    if (responese.statusCode == 200) {
      avt = json.decode(responese.body);
    }
    // for (var u in avt) }
    //   getData.add(Note.fromJson(u));
    // }
    return avt.toString();
    // ignore: avoid_print
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: avtivitys(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // ignore: avoid_unnecessary_containers
          return Container(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: avt.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsDes(
                                      id: avt[index]['id'],
                                      dates: avt[index]['dates'],
                                      description: avt[index]['description'],
                                      img: avt[index]['img'],
                                      title: avt[index]['title'],
                                      score: avt[index]['score'].toString(),
                                    )));
                      },
                      child: Stack(
                        children: [
                          // ignore: duplicate_ignore, duplicate_ignore
                          Container(
                            height: 100,
                            // ignore: prefer_const_constructors
                            decoration: BoxDecoration(
                                // ignore: prefer_const_constructors
                                color: Color.fromRGBO(239, 255, 255, 1),
                                border: Border(
                                    bottom: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ))

                                // ignore: prefer_const_literals_to_create_immutables
                                ),

                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  child: Image.network(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "https://dtechthailand.com/appwatashi/_img/news/" +
                                          avt[index]['img']),
                                ),
                                // ignore: prefer_const_constructors
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Column(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          // ignore: prefer_const_constructors
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6,
                                                left: 10,
                                                bottom: 0,
                                                right: 6),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables

                                              children: [
                                                // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
                                                Container(
                                                  // ignore: prefer_const_constructors
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      avt[index]['description'],
                                                      maxLines: 5,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      softWrap: true,
                                                      style: TextStyle(
                                                        fontSize: 9,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        left: 0,
                                        bottom: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Row(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  const Icon(
                                                    Icons.access_time,
                                                    color: kRedColor,
                                                    size: 8,
                                                  ),
                                                  // ignore: prefer_const_constructors
                                                  Text(
                                                    // ignore: prefer_interpolation_to_compose_strings
                                                    '' +
                                                        avt[index]['dates'] +
                                                        ' ',
                                                    style: kTextFnews,
                                                  ),
                                                  const Icon(
                                                    Icons.person,
                                                    color: kRedColor,
                                                    size: 8,
                                                  ),
                                                  Text(
                                                    // ignore: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings
                                                    ' ' +
                                                        avt[index]['score']
                                                            .toString(),
                                                    style: kTextFnews,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 50,
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                color: Colors.red,
                                // ignore: prefer_const_constructors
                                borderRadius: BorderRadius.only(
                                  // ignore: prefer_const_constructors
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              child: Center(
                                // ignore: prefer_const_constructors
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    "Click",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
          // ignore: duplicate_ignore
        } else {
          // ignore: avoid_unnecessary_containers
          return Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
