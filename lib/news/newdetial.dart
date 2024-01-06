// ignore: unnecessary_import
// ignore_for_file: unused_import, unused_local_variable, prefer_const_constructors, duplicate_ignore

import 'dart:convert';
import 'dart:ui';

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class NewsDes extends StatefulWidget {
  String id, score, title, description, dates, img;
  NewsDes({
    Key? key,
    required this.id,
    required this.dates,
    required this.description,
    required this.img,
    required this.title,
    required this.score,
  }) : super(key: key);

  @override
  State<NewsDes> createState() => _NewsDesState();
}

class _NewsDesState extends State<NewsDes> {
  Future upds() async {
    // ignore: prefer_interpolation_to_compose_strings
    var url = 'https://dtechthailand.com/appbase/updscore.php?idkey=' +
        widget.id +
        '&pname=NEWS';

    var responese = await http.get(Uri.parse(url));

    // ignore: avoid_print
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    upds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: kPrimaryColor,
          title: const Text(
            "รายละเอียดข่าวสาร",
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
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Colors.white),
            child: ListView(
              children: [
                imag(context),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Row(
                                children: [
                                  // ignore: prefer_const_constructors
                                  Icon(
                                    Icons.access_time,
                                    size: 14,
                                    color: Colors.orange,
                                  ),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  Text(
                                    widget.dates,
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  // ignore: prefer_const_constructors
                                  Icon(Icons.person,
                                      size: 12, color: Colors.orange),
                                  Text(widget.score,
                                      style: TextStyle(color: Colors.orange))
                                ],
                              ),
                              // Row(
                              //   // ignore: prefer_const_literals_to_create_immutables
                              //   children: [
                              //     Column(
                              //       crossAxisAlignment: CrossAxisAlignment.end,
                              //       children: [
                              //         RatingBar(
                              //           initialRating: 3,
                              //           direction: Axis.horizontal,
                              //           allowHalfRating: true,
                              //           itemCount: 5,
                              //           itemSize: 17,
                              //           ratingWidget: RatingWidget(
                              //             full: Image.asset(
                              //               'images/heart.png',
                              //               color: Colors.red,
                              //             ),
                              //             half: Image.asset(
                              //                 'images/heart_half.png',
                              //                 color: Colors.red),
                              //             empty: Image.asset(
                              //                 'images/heart_border.png',
                              //                 color: Colors.red),
                              //           ),
                              //           itemPadding:
                              //               // ignore: prefer_const_constructors
                              //               EdgeInsets.symmetric(
                              //                   horizontal: 4.0),
                              //           onRatingUpdate: (rating) {
                              //             // ignore: avoid_print
                              //             print(rating);
                              //           },
                              //         ),
                              //       ],
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                        // ignore: prefer_const_constructors
                        Divider(
                          height: 1,
                          color: Colors.black12,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }

  Stack imag(BuildContext context) {
    return Stack(
      children: [
        // ignore: sized_box_for_whitespace
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  // ignore: prefer_interpolation_to_compose_strings
                  "https://dtechthailand.com/appwatashi/_img/news/" +
                      widget.img,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ],
    );
  }
}
