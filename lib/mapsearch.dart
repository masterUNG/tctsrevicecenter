// ignore_for_file: prefer_const_constructors, duplicate_ignore, deprecated_member_use, must_be_immutable

import 'dart:convert';

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:path/path.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'mapdetial.dart';

// ignore: camel_case_types
class mapsearchs extends StatefulWidget {
  String lat, lng;
  mapsearchs({Key? key, required this.lat, required this.lng})
      : super(key: key);

  @override
  State<mapsearchs> createState() => _mapsearchsState();
}

// ignore: camel_case_types
class _mapsearchsState extends State<mapsearchs> {
  List maplist = [];
  List searchmaplist = [];

  // ignore: non_constant_identifier_names
  Future<String> mapgetData() async {
    // ignore: prefer_interpolation_to_compose_strings
    var url = 'https://dtechthailand.com/appbase/maproad.php?lat=' +
        widget.lat +
        "&lng=" +
        widget.lng;
    var responese = await http.get(Uri.parse(url));
    // ignore: avoid_print
    if (responese.statusCode == 200) {
      maplist = json.decode(responese.body);
    }
    // for (var u in maplist) }
    //   getData.add(Note.fromJson(u));
    // }
    return maplist.toString();
  }

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Column(
            children: [
              AppBar(
                elevation: 0,
                centerTitle: false,
                title: Text(
                  "ศูนย์บริการทั้งหมด",
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
                backgroundColor: kPrimaryColor,
              ),
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 8, right: 8, bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: TextField(
                        controller: _controller,
                        //autofocus: true,
                        onChanged: (value) async {
                          // ignore: avoid_print
                          //print(_controller.text);

                          setState(() {
                            searchmaplist = maplist
                                .where((element) =>
                                    element["cname"]
                                        .toString()
                                        .toLowerCase()
                                        .contains(value.toLowerCase()) ||
                                    element["addess"]
                                        .toString()
                                        .toLowerCase()
                                        .contains(value.toLowerCase()) ||
                                    element["phone"]
                                        .toString()
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                .toList();
                            //print(maplist);
                          });
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                            hintText: 'ชื่อร้าน,ที่อยู่,เบอร์โทร',
                            hintStyle:
                                TextStyle(fontSize: 13, color: Colors.black26),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: kPrimaryColor,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _controller.clear();
                                  });
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: kPrimaryColor,
                                ))),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
      // ignore: avoid_unnecessary_containers
      body: single(), // Shimmer effect
    );
  }

  Container loading() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          // ignore: avoid_unnecessary_containers
          return Container(
            // height: 100,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.3),
                  highlightColor: Colors.grey.withOpacity(0.2),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Container(
                              height: 13,
                              width: 230,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Icon(
                              Icons.more_vert,
                              size: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Container(
                          height: 13,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 13,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 30,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 30,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container single() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: FutureBuilder(
        future: mapgetData(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: _controller.text.isNotEmpty
                  ? searchmaplist.length
                  : maplist.length,
              itemBuilder: (BuildContext context, int index) {
                // ignore: unused_local_variable
                String lag = _controller.text.isNotEmpty
                    ? searchmaplist[index]['lat']
                    : maplist[index]['lat'];
                // ignore: unused_local_variable
                String lng = _controller.text.isNotEmpty
                    ? searchmaplist[index]['lon']
                    : maplist[index]['lon'];
                String cname = _controller.text.isNotEmpty
                    ? searchmaplist[index]['cname']
                    : maplist[index]['cname'];
                String addess = _controller.text.isNotEmpty
                    ? searchmaplist[index]['addess']
                    : maplist[index]['addess'];
                String province = _controller.text.isNotEmpty
                    ? searchmaplist[index]['province']
                    : maplist[index]['province'];
                String phone = _controller.text.isNotEmpty
                    ? searchmaplist[index]['phone']
                    : maplist[index]['phone'];
                String detal = _controller.text.isNotEmpty
                    ? searchmaplist[index]['detal']
                    : maplist[index]['detal'];
                String works = _controller.text.isNotEmpty
                    ? searchmaplist[index]['works']
                    : maplist[index]['works'];
                String img = _controller.text.isNotEmpty
                    ? searchmaplist[index]['img']
                    : maplist[index]['img'];
                String km = _controller.text.isNotEmpty
                    ? searchmaplist[index]['km']
                    : maplist[index]['km'];
                // ignore: avoid_unnecessary_containers
                return Container(
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              // ignore: avoid_unnecessary_containers
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(cname,
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: kPrimaryColor)),
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  // ignore: prefer__ructors
                                                  builder: (context) =>
                                                      mapdetials(
                                                    cname: cname.toString(),
                                                    addess: addess.toString(),
                                                    province:
                                                        province.toString(),
                                                    phone: phone.toString(),
                                                    detal: detal.toString(),
                                                    work: works.toString(),
                                                    img: img.toString(),
                                                    lat: lag.toString(),
                                                    lng: lng.toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Icon(
                                              Icons.arrow_circle_right_outlined,
                                              color: kPrimaryColor,
                                            ))
                                      ],
                                    ),
                                    Text(
                                      addess,
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 14,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          works,
                                          style: TextStyle(
                                              fontSize: 10, color: Colors.red),
                                        ),
                                        Icon(
                                          Icons.phone,
                                          size: 12,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          phone,
                                          style: TextStyle(
                                              fontSize: 11, color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: kPrimaryColor),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 6,
                                                right: 6,
                                                top: 4,
                                                bottom: 4),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons
                                                      .directions_bike_outlined,
                                                  size: 12,
                                                  color: Colors.white,
                                                ),
                                                Text(
                                                  // ignore: prefer_interpolation_to_compose_strings
                                                  " " + km.toString(),
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                // ignore: deprecated_member_use
                                                child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    String googleUrl =
                                                        "https://www.google.com/maps/search/?api=1&query=$lag,$lng";
                                                    launch(googleUrl);
                                                  },
                                                  icon: const Icon(Icons
                                                      .directions_car_rounded),
                                                  label: const Text(
                                                    "ขอเส้นทาง",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0)),
                                                    primary: Colors.white,
                                                    onPrimary: kPrimaryColor,
                                                    side: BorderSide(
                                                        width: 1,
                                                        color: kPrimaryColor),
                                                    elevation: 0,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    // ignore: prefer_interpolation_to_compose_strings
                                                    launch('tel:' + phone);
                                                  },
                                                  icon: const Icon(
                                                      Icons.phone_forwarded),
                                                  label: const Text(
                                                    "โทรหาร้านค้า",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0)),
                                                    primary: Colors.white,
                                                    onPrimary: kPrimaryColor,
                                                    side: BorderSide(
                                                        width: 1,
                                                        color: kPrimaryColor),
                                                    elevation: 0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return loading();
        },
      ),
    );
  }
}
