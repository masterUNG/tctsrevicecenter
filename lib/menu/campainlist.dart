// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:convert';

import 'package:tctservicecenter/constants.dart';
import 'package:tctservicecenter/menu/campainweb.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class CampainList extends StatefulWidget {
  const CampainList({Key? key}) : super(key: key);

  @override
  State<CampainList> createState() => _CampainListState();
}

class _CampainListState extends State<CampainList> {
  bool isLoaded = false;
  @override
  // void initState() {
  // ignore: todo
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration(milliseconds: 3000), () {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   });
  // }

  @override
  // ignore: override_on_non_overriding_member
  List promo = [];

  // ignore: non_constant_identifier_names
  Future<String> prod() async {
    var url = 'https://dtechthailand.com/appbase/campian.php';
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

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: kPrimaryColor,
        title: Text(
          "กิจกรรมน่าสนใจ",
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
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: FutureBuilder(
          future: prod(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // ignore: avoid_unnecessary_containers
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: body(),
                ),
              );
            } else {
              return Container(child: shim());
            }
          },
        ),
      ),
    );
  }

  shim() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.6),
      highlightColor: Colors.grey.withOpacity(0.2),
      child: GridView.builder(
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.6),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  )),
              child: Column(
                children: [
                  Image.asset(
                    "images/shimmer1.gif",
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: Container(
                      height: 11,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: Container(
                      height: 11,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: Container(
                      height: 11,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  GridView body() {
    return GridView.builder(
        itemCount: promo.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => CampainWebs(
                        link: promo[index]['link'].toString(),
                        image: promo[index]['image'].toString(),
                        imagedes: promo[index]['imagedes'].toString(),
                        title: promo[index]['title'].toString(),
                        description: promo[index]['description'].toString(),
                      )),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        // ignore: prefer_interpolation_to_compose_strings
                        "https://dtechthailand.com/appwatashi/_img/activity/" +
                            promo[index]['image'],
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          promo[index]['title'],
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      child: Center(
                        // ignore: prefer_const_constructors
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Click",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
