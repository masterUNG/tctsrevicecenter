// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, annotate_overrides, avoid_unnecessary_containers

import 'dart:convert';

import 'package:tctservicecenter/constants.dart';
import 'package:tctservicecenter/menu/promotionweb.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PromotionList extends StatefulWidget {
  const PromotionList({Key? key}) : super(key: key);

  @override
  State<PromotionList> createState() => _PromotionListState();
}

class _PromotionListState extends State<PromotionList> {
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: kPrimaryColor,
        title: Text(
          "โปรโมชั่นแนะนำ",
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
        child: FutureBuilder(
          future: prod(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      itemCount: promo.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => PromotionWebs(
                                      link: promo[index]['link'].toString(),
                                      image: promo[index]['img'].toString(),
                                      title: promo[index]['title'].toString(),
                                      description: promo[index]['description']
                                          .toString(),
                                      price: promo[index]['price'].toString(),
                                    )),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                child: Image.network(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  "https://dtechthailand.com/appwatashi/_img/promotion_campain/" +
                                      promo[index]['img'],
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              );
            } else {
              return Container(
                child: Center(
                  child: SizedBox(
                    height: 90,
                    width: 90,
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
