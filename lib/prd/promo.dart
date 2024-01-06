// ignore_for_file: avoid_unnecessary_containers, duplicate_ignore, prefer_const_constructors

import 'dart:convert';

import 'package:tctservicecenter/constants.dart';
import 'package:tctservicecenter/prd/promodetial.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:path/path.dart';
// ignore: unused_import
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

class Promotion extends StatefulWidget {
  const Promotion({Key? key}) : super(key: key);

  @override
  State<Promotion> createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
  List promo = [];

  // ignore: non_constant_identifier_names
  Future<String> newsData() async {
    var url = 'https://dtechthailand.com/appbase/promo.php';
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
          "สินค้าแนะนำ",
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
      child: Container(
        child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 120,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.4),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: Offset(0, 1.5))
                      ]),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          Image.asset("images/shimmer2.gif"),
                        ],
                      ),
                      // ignore: prefer_const_constructors
                      Expanded(
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 6, left: 10, bottom: 0, right: 6),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables

                                children: [
                                  // ignore: sized_box_for_whitespace
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                    ),
                                    child: Container(
                                      height: 15,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),

                                  // ignore: sized_box_for_whitespace
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                    ),
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
                                      top: 5,
                                    ),
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
                                      top: 5,
                                    ),
                                    child: Container(
                                      height: 11,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 5,
                                        ),
                                        child: Container(
                                          height: 11,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 18,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: const Color.fromRGBO(
                                                255, 165, 2, 1),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Text(
                                                  "0",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white),
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 18,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: const Color.fromRGBO(
                                                241, 242, 246, 1),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Colors.black38,
                                                  size: 10,
                                                ),
                                                Text(
                                                  " เพิ่มเติม",
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.black38),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container ListData() {
    return Container(
      child: ListView.builder(
          itemCount: promo.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 120,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: Offset(0, 1.5))
                    ]),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => promodesc(
                                          imga: promo[index]['img'],
                                          title: promo[index]['title'],
                                          price: promo[index]['price'],
                                          des: promo[index]['description'],
                                          urls: promo[index]['url'],
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              // color: HexColor(promo[index]['bgcolor']),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              child: Image.network(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  "https://dtechthailand.com/appwatashi/_img/promotion/" +
                                      promo[index]['img']),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          child: Container(
                              height: 15,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 71, 87, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: 0.5,
                                        blurRadius: 0.8,
                                        offset: Offset(0, 0.5))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    NumberFormat("###,##0.00").format(
                                            double.parse(
                                                promo[index]['count'])) +
                                        "%",
                                    style: TextStyle(
                                        fontSize: 9, color: Colors.white),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                    // ignore: prefer_const_constructors
                    Expanded(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 6, left: 10, bottom: 0, right: 6),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables

                              children: [
                                // ignore: sized_box_for_whitespace
                                Container(
                                  // ignore: prefer_const_constructors
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      promo[index]['title'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: const TextStyle(
                                          color: Colors.black87, fontSize: 12),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                // ignore: sized_box_for_whitespace
                                Container(
                                  height: 45,
                                  // ignore: prefer_const_constructors
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    // ignore: prefer_const_constructors
                                    child: Text(
                                      promo[index]['description'],
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      // ignore: prefer_const_constructors
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                ),
                                // ignore: prefer_const_literals_to_create_immutables
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Row(children: [
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      NumberFormat("###,##0.00").format(
                                              double.parse(
                                                  promo[index]['price'])) +
                                          " BTH",
                                      // ignore: unnecessary_const
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38),
                                    ),
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      ' ' +
                                          NumberFormat("###,##0.00").format(
                                              double.parse(
                                                  promo[index]['price2'])) +
                                          " BTH",
                                      // ignore: unnecessary_const
                                      style: const TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black26,
                                        fontStyle: FontStyle.italic,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.red,
                                      ),
                                    ),
                                  ]),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // InkWell(
                                      //   onTap: () {
                                      //     _popupDialog(context);
                                      //   },
                                      //   child: Container(
                                      //     height: 18,
                                      //     width: 50,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.all(
                                      //           Radius.circular(20)),
                                      //       color: const Color.fromRGBO(
                                      //           255, 165, 2, 1),
                                      //     ),
                                      //     child: Padding(
                                      //       padding: const EdgeInsets.all(3.0),
                                      //       child: Row(
                                      //         // ignore: prefer_const_literals_to_create_immutables
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.center,
                                      //         // ignore: prefer_const_literals_to_create_immutables
                                      //         children: [
                                      //           Text(
                                      //             "0",
                                      //             style: TextStyle(
                                      //                 fontSize: 10,
                                      //                 color: Colors.white),
                                      //           ),
                                      //           Icon(
                                      //             Icons.star,
                                      //             color: Colors.white,
                                      //             size: 10,
                                      //           ),
                                      //         ],
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      promodesc(
                                                        imga: promo[index]
                                                            ['img'],
                                                        title: promo[index]
                                                            ['title'],
                                                        price: promo[index]
                                                            ['price'],
                                                        des: promo[index]
                                                            ['description'],
                                                        urls: promo[index]
                                                            ['url'],
                                                      )));
                                        },
                                        child: Container(
                                          height: 18,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: const Color.fromRGBO(
                                                241, 242, 246, 1),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Row(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Colors.black38,
                                                  size: 10,
                                                ),
                                                Text(
                                                  " เพิ่มเติม",
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.black38),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  // Future<void> _popupDialog(BuildContext context) async {
  //   double rings = 0;
  //   showDialog(
  //       barrierDismissible: true,
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Center(
  //             child: Text(
  //               'โปรดให้คะแนนเราด้วยน่ะคะ !!',
  //               style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  //             ),
  //           ),
  //           content: Container(
  //             height: 20,
  //             alignment: Alignment.center,
  //             child: RatingBar.builder(
  //               initialRating: 0,
  //               minRating: 1,
  //               direction: Axis.horizontal,
  //               allowHalfRating: true,
  //               itemCount: 5,
  //               itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
  //               itemBuilder: (context, _) => Icon(
  //                 Icons.star,
  //                 color: Colors.amber,
  //               ),
  //               onRatingUpdate: (rating) {
  //                 rings = rating;
  //               },
  //             ),
  //           ),
  //           actions: <Widget>[
  //             Row(
  //               children: [
  //                 Expanded(
  //                     child: MaterialButton(
  //                   color: Color.fromRGBO(241, 242, 246, 1),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(5.0),
  //                   ),
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: Text(
  //                     "ยกเลิก",
  //                     style: TextStyle(
  //                         color: Colors.black54,
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.bold),
  //                   ),
  //                 )),
  //                 Container(
  //                   width: 30,
  //                 ),
  //                 Expanded(
  //                     child: MaterialButton(
  //                   color: Colors.green,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(5.0),
  //                   ),
  //                   onPressed: () {
  //                     // ignore: avoid_print
  //                     print("จำนวนดาว : $rings");
  //                     Navigator.pop(context);
  //                   },
  //                   child: Text(
  //                     "ตกลง",
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.bold),
  //                   ),
  //                 )),
  //               ],
  //             )
  //           ],
  //         );
  //       });
  // }
}
