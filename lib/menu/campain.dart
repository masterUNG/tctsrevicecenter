// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:hexcolor/hexcolor.dart';

import 'campainweb.dart';

class Camp extends StatefulWidget {
  const Camp({Key? key}) : super(key: key);

  @override
  State<Camp> createState() => _CampState();
}

class _CampState extends State<Camp> {
  List cam = [];
  // ignore: non_constant_identifier_names
  Future<String> prod() async {
    var url = 'https://dtechthailand.com/appbase/campian.php';
    var responese = await http.get(Uri.parse(url));
    // ignore: avoid_print
    if (responese.statusCode == 200) {
      cam = json.decode(responese.body);
    }
    // for (var u in promo) }
    //   getData.add(Note.fromJson(u));
    // }
    return cam.toString();
    // ignore: avoid_print
  }

  @override
  Widget build(BuildContext context) {
    return pages();
  }

  FutureBuilder<String> pages() {
    return FutureBuilder(
      future: prod(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            height: 190.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cam.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => CampainWebs(
                                link: cam[index]['link'].toString(),
                                image: cam[index]['img'].toString(),
                                imagedes: cam[index]['imagedes'].toString(),
                                title: cam[index]['title'].toString(),
                                description:
                                    cam[index]['description'].toString(),
                              )),
                        ),
                      );
                    },
                    child: Container(
                      width: 317,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Image.network(
                          "https://dtechthailand.com/appwatashi/_img/activity/" +
                              cam[index]['image'],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
          // ignore: duplicate_ignore
        } else {
          // ignore: avoid_unnecessary_containers
          return Container(
            child: Center(
              child: CircularProgressIndicator(
                // ignore: unnecessary_const
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
            ),
          );
          // ignore: empty_statements, dead_code
          ;
        }
      },
    );
  }
}
