// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_import, duplicate_ignore, avoid_unnecessary_containers, camel_case_types, sized_box_for_whitespace

import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:tctservicecenter/constants.dart';
import 'package:tctservicecenter/contact.dart';
import 'package:tctservicecenter/menu/campain.dart';
import 'package:tctservicecenter/menu/campainlist.dart';
import 'package:tctservicecenter/menu/promotion.dart';
import 'package:tctservicecenter/menu/promotionlist.dart';
import 'package:tctservicecenter/phone.dart';
import 'package:tctservicecenter/prd/promo.dart';
import 'package:tctservicecenter/repair/repair.dart';
import 'package:tctservicecenter/repair/scanrepair.dart';
import 'package:tctservicecenter/scan.dart';
import 'package:tctservicecenter/warranty/warranty.dart';
import 'package:tctservicecenter/delivery.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../maptest.dart';

import '../map.dart';
import '../news/new.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'activity.dart';

class Menus extends StatefulWidget {
  const Menus({Key? key}) : super(key: key);

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  List slider = [];
  late double lat, lng;
  Future<Null> fildLatLng() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   setState(() {
    //     lat = currentLocation.latitude!;
    //     lng = currentLocation.longitude!;
    //   });

    //   // print(currentLocation.latitude);
    //   // print(currentLocation.longitude);
    //   // print(currentLocation.accuracy);
    //   // print(currentLocation.altitude);
    //   // print(currentLocation.speed);
    //   // // print(currentLocation.speed_accuracy); Will always be 0 on iOS
    //   // print(currentLocation.heading);
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fildLatLng();
  }

  List itemsMenu = [
    {"image": "icons/1.png", "title": "ศูนย์บริการ", "links": "location"},
    {"image": "icons/4.png", "title": "ตรวจของซ่อม", "links": "repair"},
    {"image": "icons/3.png", "title": "การรับประกัน", "links": "warranty"},
    {"image": "icons/7.png", "title": "ตรวจสถานะสินค้า", "links": "delivery"},
    {"image": "icons/2.png", "title": "สินค้าแนะนำ", "links": "online"},
    {"image": "icons/5.png", "title": "ข่าวสาร", "links": "news"},
  ];

  List imgList = ["https://dtechthailand.com/appwatashi/_img/slider/1795.jpg"];

  // ignore: non_constant_identifier_names
  Future<String> newsData() async {
    var url = 'https://dtechthailand.com/appbase/slider.php';
    var responese = await http.get(Uri.parse(url));
    // ignore: avoid_print
    if (responese.statusCode == 200) {
      slider = json.decode(responese.body);
    }
    // for (var u in promo) }
    //   getData.add(Note.fromJson(u));
    // }
    return slider.toString();
    // ignore: avoid_print
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        // ignore:, avoid_print
        Navigator.push(
            context,
            MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => ScanRepairs(),
            ));
      } else if (index == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => Myscan(),
            ));
      } else if (index == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => phoneCall(),
            ));
      } else if (index == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => News(),
            ));
      } else if (index == 4) {
        Navigator.push(
            context,
            MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => Contacts(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          elevation: 2,
          backgroundColor: kPrimaryColor,
          // ignore: prefer_const_constructors
          centerTitle: false,
          // leading: IconButton(
          //   onPressed: () {
          //     /// link Page

          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           // ignore: prefer_const_constructors
          //           builder: (context) => logins(),
          //         ));
          //   },
          //   icon: Icon(
          //     Icons.person_pin,
          //     size: 30,
          //   ),
          // ),

          title: Text(
            "บริษัท ทีซีที เอสเซสโซรี่ จํากัด",
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
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 15),
          //     child: Row(
          //       // ignore: prefer_const_literals_to_create_immutables
          //       children: [
          //         Stack(
          //           // ignore: prefer_const_literals_to_create_immutables
          //           children: [
          //             Icon(
          //               Icons.notifications,
          //               size: 30,
          //             ),
          //             // Positioned(
          //             //   right: 0,
          //             //   child: Container(
          //             //       width: 17,
          //             //       height: 17,
          //             //       decoration: BoxDecoration(
          //             //           color: Colors.red,
          //             //           borderRadius: BorderRadius.circular(50)),
          //             //       child: Center(
          //             //         child: Text(
          //             //           "20",
          //             //           style: TextStyle(fontSize: 9),
          //             //         ),
          //             //       )),
          //             // ),
          //           ],
          //         )
          //       ],
          //     ),
          //   )
          // ],
        ),
      ),
      body: Container(
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: newMethod(),
              ),
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "เครื่องมือการบริการ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                    menus(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(247, 253, 255, 1)

                        // gradient: LinearGradient(
                        //     begin: Alignment.topLeft,
                        //     end: Alignment.bottomRight,
                        //     colors: [
                        //       Color.fromARGB(255, 241, 242, 243),
                        //       Color.fromARGB(204, 177, 177, 177)
                        //     ]),
                        ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "กิจกรรมน่าสนใจ",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text("ดูทั้งหมด",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CampainList()));
                                },
                              ),
                            ],
                          ),
                        ),

                        /////////// กิจกรรม
                        SizedBox(
                          height: 10,
                        ),
                        Camp(),
                        /////////// โปรโมชั่นพิเศษ
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "โปรโมชั่นแนะนำ",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text("ดูทั้งหมด",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PromotionList()));
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        promot(),

                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                "กิจกรรมประชาสัมพันธ์",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text("ดูทั้งหมด",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Icon(
                                      Icons.arrow_right_alt,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        // ignore: prefer_const_constructors
                                        builder: (context) => News(),
                                      ));
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 400,
                          child: avtivity(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
              )
              //// กิจกรรม
              ///
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white54,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        currentIndex: _selectedIndex,
        unselectedFontSize: 9,
        selectedLabelStyle: TextStyle(fontSize: 11),
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'ตรวจของซ่อม',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'ตรวจประกัน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'โทรด่วน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_label),
            label: 'ข่าวสาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_home_work_outlined),
            label: 'ติดต่อ',
          ),
        ],
      ),
    );
  }

  FutureBuilder<String> newMethod() {
    return FutureBuilder(
        future: newsData(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider.builder(
                itemCount: slider.length,
                itemBuilder: (context, index, realIndex) {
                  //print(index);
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      // ignore: prefer_interpolation_to_compose_strings
                      "https://dtechthailand.com/appwatashi/_img/slider/" +
                          slider[index]['img'],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                options: CarouselOptions(
                    //height: MediaQuery.of(context).size.height,
                    height: 255,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayInterval: Duration(seconds: 3),
                    onPageChanged: (index, reason) {}),
              ),
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  // ignore: unnecessary_const
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
            );
          }
        });
  }

  menus() {
    return Container(
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.all(10),
          itemCount: itemsMenu.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, index) {
            var iconLink = itemsMenu[index]['links'];
            return InkWell(
              onTap: () {
                if (iconLink == 'warranty') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => pagewarranty(),
                      ));
                } else if (iconLink == 'contact') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => Contacts(),
                      ));
                } else if (iconLink == 'location') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => maps(),
                      ));
                } else if (iconLink == 'online') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => Promotion(),
                      ));
                } else if (iconLink == 'repair') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => repairs(),
                      ));
                } else if (iconLink == 'news') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => News(),
                      ));
                } else if (iconLink == 'delivery') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => delivery(),
                      ));
                }
              },
              child: Container(
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    // gradient: LinearGradient(
                    //     stops: [0.5, 1],
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight,
                    //     colors: [kPrimaryColor, Colors.blue]),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0), //iCON
                        child: Container(
                          child: Image.asset(itemsMenu[index]['image']),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Center(
                        child: Text(
                          itemsMenu[index]['title'],
                          style: TextStyle(fontSize: 11, color: Colors.white),
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

class userActive extends StatelessWidget {
  const userActive({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: Icon(
            Icons.person,
            color: kPrimaryColor,
            size: 35,
          ),
        ),
        Text(
          "คุณเชษฐพงศ์ บุญเพ็ง",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
