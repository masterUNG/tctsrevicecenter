// ignore_for_file: unused_import, camel_case_types

import 'dart:convert';

import 'package:tctservicecenter/menu/promotionweb.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

class promot extends StatefulWidget {
  const promot({Key? key}) : super(key: key);

  @override
  State<promot> createState() => _promotState();
}

class _promotState extends State<promot> {
  List promo = [];
  // ignore: non_constant_identifier_names
  Future<String> prod() async {
    var url = 'https://dtechthailand.com/appbase/promotion_campain.php';
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
    return pages();
  }

  SizedBox pages() {
    return SizedBox(
      height: 168,
      child: FutureBuilder(
        future: prod(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: promo.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  // ignore: sized_box_for_whitespace
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => PromotionWebs(
                                link: promo[index]['link'].toString(),
                                image: promo[index]['img'].toString(),
                                title: promo[index]['title'].toString(),
                                description:
                                    promo[index]['description'].toString(),
                                price: promo[index]['price'].toString(),
                              )),
                        ),
                      );
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(7)),
                      width: 168,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.network(
                          // ignore: prefer_interpolation_to_compose_strings
                          "https://dtechthailand.com/appwatashi/_img/promotion_campain/" +
                              promo[index]['img'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
            // ignore: duplicate_ignore
          } else {
            // ignore: avoid_unnecessary_containers
            return Container(
              child: const Center(
                child: CircularProgressIndicator(
                  // ignore: unnecessary_const
                  valueColor: const AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
