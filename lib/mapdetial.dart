// ignore: duplicate_ignore
// ignore: duplicate_ignore
// ignore_for_file: prefer_const_constructors, duplicate_ignore, deprecated_member_use

import 'dart:math';

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
// ignore: unused_import
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types, must_be_immutable
class mapdetials extends StatefulWidget {
  String cname, addess, province, work, detal, phone, img, lat, lng;
  mapdetials({
    Key? key,
    required this.cname,
    required this.addess,
    required this.province,
    required this.work,
    required this.detal,
    required this.phone,
    required this.img,
    required this.lat,
    required this.lng,
  }) : super(key: key);

  @override
  State<mapdetials> createState() => _mapdetialsState();
}

// ignore: camel_case_types, duplicate_ignore, duplicate_ignore
class _mapdetialsState extends State<mapdetials> {
  late double lat1, lng1, lat2, lng2;
  late String distanceString;

  double distance = 0;
  @override
  void initState() {
    super.initState();
    findLat1Lng1();
  }

  Future<void> findLat1Lng1() async {
    LocationData? locationData = await findLocationData();
    setState(() {
      lat1 = locationData!.latitude!;
      lng1 = locationData.longitude!;
      lat2 = double.parse(widget.lat);
      lng2 = double.parse(widget.lng);
      distance = calculateDistance(lat1, lng1, lat2, lng2);
      // ignore: avoid_print
      print('lat1 =$lat1,lng1 =$lng1 => lat2=$lat2 , lng2=$lng2 ');
      // var strFormat = NumberFormat('###,##0.0', 'en_US');
      // distanceString = strFormat.format(distance);
    });
  }

  double calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lng2 - lng1) * p)) / 2;
    distance = 12742 * asin(sqrt(a));

    return distance;
  }

  Future<LocationData?> findLocationData() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      return null;
    }
  }

  // ignore: duplicate_ignore, duplicate_ignore
  @override
  // ignore: duplicate_ignore, duplicate_ignore
  Widget build(BuildContext context) {
    // ignore: duplicate_ignore, duplicate_ignore
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "ข้อมูลศูนย์บริการ",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
      // ignore: avoid_unnecessary_containers, duplicate_ignore, duplicate_ignore
      body: Container(
        color: Colors.white,
        // ignore: duplicate_ignore, duplicate_ignore
        child: ListView(
          // ignore: duplicate_ignore, duplicate_ignore
          children: [
            // ignore: sized_box_for_whitespace
            Stack(children: [
              Container(

                  // ignore: unnecessary_null_comparison
                  child: widget.img.trim() != ""
                      ? Image.network(
                          // ignore: prefer_interpolation_to_compose_strings
                          "https://dtechthailand.com/appwatashi/_img/shop/" +
                              widget.img,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "images/null.jpg",
                          fit: BoxFit.cover,
                        )),
              Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 3, bottom: 3, left: 10, right: 10),
                      child: Text(
                        widget.cname,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ))
            ]),
            // ignore: prefer_const_constructors

            Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 10),
              // ignore: sort_child_properties_last
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 13, bottom: 13),
                child: Center(
                  child: Text(
                    widget.detal,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10.0)),
            ),

            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Card(
                          elevation: 0,
                          child: ListTile(
                            leading: const Icon(Icons.location_on,
                                color: kPrimaryColor),
                            title: Text(
                              widget.addess,
                              style: const TextStyle(
                                  color: kPrimaryColor, fontSize: 13),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          child: ListTile(
                            leading: const Icon(Icons.access_time,
                                color: kPrimaryColor),
                            title: Text(widget.work,
                                style: const TextStyle(
                                    color: kPrimaryColor, fontSize: 13)),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          child: ListTile(
                            leading:
                                const Icon(Icons.phone, color: kPrimaryColor),
                            title: Text(widget.phone,
                                style: const TextStyle(
                                    color: kPrimaryColor, fontSize: 13)),
                          ),
                        ),
                        Card(
                          elevation: 0,
                          child: ListTile(
                            leading: const Icon(
                              Icons.directions_bike,
                              color: kPrimaryColor,
                            ),
                            title: Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                NumberFormat("#,###,##0.00").format(distance) +
                                    ' กม.',
                                style: const TextStyle(
                                    color: kPrimaryColor, fontSize: 13)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // ignore: sized_box_for_whitespace
      bottomNavigationBar: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // ignore: prefer_interpolation_to_compose_strings
                  launch('tel:' + widget.phone);
                },
                icon: const Icon(Icons.phone_forwarded),
                label: const Text(
                  "โทรหาร้านค้า",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  primary: Colors.white,
                  onPrimary: kPrimaryColor,
                  side: BorderSide(width: 1, color: kPrimaryColor),
                  elevation: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ElevatedButton.icon(
                  onPressed: () {
                    String googleUrl =
                        "https://www.google.com/maps/search/?api=1&query=$lat2,$lng2";
                    launch(googleUrl);
                  },
                  icon: const Icon(Icons.directions_car_rounded),
                  label: const Text(
                    "ขอเส้นทาง",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    primary: Colors.white,
                    onPrimary: kPrimaryColor,
                    side: BorderSide(width: 1, color: kPrimaryColor),
                    elevation: 0,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
