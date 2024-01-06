// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

class CampainWebs extends StatefulWidget {
  String link, image, imagedes, title, description;
  CampainWebs({
    Key? key,
    required this.link,
    required this.image,
    required this.imagedes,
    required this.title,
    required this.description,
  }) : super(key: key);
  @override
  State<CampainWebs> createState() => _CampainWebsState();
}

class _CampainWebsState extends State<CampainWebs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: kPrimaryColor,
        title: Text(
          "รายละเอียดกิจกรรม",
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
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: Image.network(
                    // ignore: prefer_interpolation_to_compose_strings
                    "https://dtechthailand.com/appwatashi/_img/activity/img/" +
                        widget.imagedes,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  widget.title,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Text(
                                  widget.description,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.all(8.0),
      //   child: RaisedButton(
      //     elevation: 0,
      //     onPressed: () {
      //       String googleUrl1 = widget.link;
      //       launch(googleUrl1);
      //     },
      //     color: kPrimaryColor,
      //     textColor: Colors.white,
      //     child: Text(
      //       'เพิ่มเติม..',
      //       style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      //     ),
      //   ),
      // ),
    );
  }
}

// ignore: non_constant_identifier_names
RaisedButton(
    {required int elevation,
    required Null Function() onPressed,
    required Color color,
    required Color textColor,
    required Text child,
    required RoundedRectangleBorder shape}) {}
//Text(widget.urls)
