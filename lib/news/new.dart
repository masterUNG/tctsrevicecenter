// ignore_for_file: avoid_unnecessary_containers, duplicate_ignore, prefer_const_constructors

import 'dart:convert';

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:path/path.dart';

import 'newdetial.dart';
import 'package:shimmer/shimmer.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List promo = [];

  // ignore: non_constant_identifier_names
  Future<String> newsData() async {
    var url = 'https://dtechthailand.com/appbase/news.php';
    var responese = await http.get(Uri.parse(url));
    // ignore: avoid_print
    if (responese.statusCode == 200) {
      promo = json.decode(responese.body);
    }
    // for (var u in promo) }
    //   getData.add(Note.fromJson(u));
    // }
    return promo.toString();
    // ignore: avoid_print
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        // ignore: prefer_const_constructors
        title: Text(
          "ข่าวสารและกิจกรรม",
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
        child: FutureBuilder(
          future: newsData(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListData();
              // ignore: duplicate_ignore
            } else {
              // ignore: avoid_unnecessary_containers
              return Container(child: loading());
            }
          },
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  loading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.6),
      highlightColor: Colors.grey.withOpacity(0.2),
      child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Stack(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.6)),
                    height: 100,
                    // ignore: prefer_const_constructors

                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          "images/shimmer1.gif",
                          fit: BoxFit.cover,
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
                                        top: 6, left: 10, bottom: 0, right: 6),
                                    child: Column(
                                      // ignore: prefer_const_literals_to_create_immutables

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10, right: 10),
                                          child: Container(
                                            height: 11,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10, right: 10),
                                          child: Container(
                                            height: 11,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10, right: 10),
                                          child: Container(
                                            height: 11,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10, right: 10),
                                          child: Container(
                                            height: 11,
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                        ),
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Container(
                                              height: 11,
                                              width: 90,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
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
                        color: Colors.grey,

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
            );
          }),
    );
  }

  // ignore: non_constant_identifier_names
  Container ListData() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView.builder(
          itemCount: promo.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsDes(
                                id: promo[index]['id'],
                                dates: promo[index]['dates'],
                                description: promo[index]['description'],
                                img: promo[index]['img'],
                                title: promo[index]['title'],
                                score: promo[index]['score'].toString(),
                              )));
                },
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(239, 255, 255, 1),
                          border: Border(
                            bottom: BorderSide(
                              color: kPrimaryColor,
                              width: 1,
                            ),
                          )

                          // ignore: prefer_const_literals_to_create_immutables
                          ),

                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            child: Image.network(
                                // ignore: prefer_interpolation_to_compose_strings
                                "https://dtechthailand.com/appwatashi/_img/news/" +
                                    promo[index]['img']),
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
                                          // ignore: sized_box_for_whitespace
                                          Container(
                                            // ignore: prefer_const_constructors
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                promo[index]['description'],
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
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
                                              color: kPrimaryColor,
                                              size: 8,
                                            ),
                                            // ignore: prefer_const_constructors
                                            Text(
                                              // ignore: prefer_interpolation_to_compose_strings
                                              '' + promo[index]['dates'] + ' ',
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Icon(
                                              Icons.person,
                                              color: kPrimaryColor,
                                              size: 8,
                                            ),
                                            Text(
                                              // ignore: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings
                                              ' ' +
                                                  promo[index]['score']
                                                      .toString(),
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold),
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
                          color: kPrimaryColor,
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
                              "อ่านต่อ",
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
  }
}
