// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:convert';

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: camel_case_types, must_be_immutable
class shopdetial extends StatefulWidget {
  String id, name, address, tel, works, lat, lng, sho;
  shopdetial({
    Key? key,
    required this.id,
    required this.name,
    required this.address,
    required this.tel,
    required this.works,
    required this.lat,
    required this.lng,
    required this.sho,
  }) : super(key: key);

  @override
  State<shopdetial> createState() => _shopdetialState();
}

// ignore: camel_case_types
class _shopdetialState extends State<shopdetial> {
  late double lat, lng;
  @override
  void initState() {
    super.initState();
    fLatLng();
  }

  // ignore: prefer_void_to_null
  Future<Null> fLatLng() async {
    LocationData? locationData = await fLocationData();
    lat = locationData!.latitude!;
    lng = locationData.longitude!;
    // ignore: avoid_print
    print('lat : $lat long : $lng'); // GET LOCATION
  }

  Future<LocationData?> fLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  @override
  // ignore: override_on_non_overriding_member
  List imgs = [];
// ignore: non_constant_identifier_names
  Future<String> ListShopPhoto() async {
    // ignore: prefer_interpolation_to_compose_strings
    var url =
        "https://dtechthailand.com/appbase/shop_images.php?id=" + widget.id;

    var responese = await http.get(Uri.parse(url));
    // ignore: avoid_print
    if (responese.statusCode == 200) {
      imgs = json.decode(responese.body);
    }
    // for (var u in promo) }
    //   getData.add(Note.fromJson(u));
    // }
    return imgs.toString();
    // ignore: avoid_print
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text(
          "ศูนย์บริการประจำสาขา",
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
          child: Column(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
              child: Card(
            elevation: 0,
            child: ListTile(
              leading: Image.asset(
                "icons/maps.gif",
              ),
              title: Text(
                widget.name,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
              subtitle: Column(
                children: [
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Text(
                      widget.address,
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.alarm_on_outlined,
                          size: 15,
                          color: Colors.red.withOpacity(0.8),
                        ),
                        Text(
                          widget.works,
                          style: TextStyle(
                              fontSize: 11, color: Colors.red.withOpacity(0.8)),
                        )
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 3,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone_android_sharp,
                          size: 15,
                          color: Colors.grey.shade400,
                        ),
                        Text(
                          widget.tel,
                          style: TextStyle(
                              fontSize: 11, color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.yellow.shade100,
                        borderRadius: BorderRadius.circular(3)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "* บริการ ขายสินค้า ปลีก-ส่ง,รับสินค้าซ่อม,ติดตั้งระบบความปลอดภัย",
                        style: TextStyle(color: Colors.red, fontSize: 9),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // ignore: prefer_interpolation_to_compose_strings
                          launch('tel:' + widget.tel);
                        },
                        icon: const Icon(Icons.phone_forwarded),
                        label: const Text(
                          "โทรหาร้านค้า",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
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
                                "https://www.google.com/maps/search/?api=1&query=${widget.lat},${widget.lng}";
                            launch(googleUrl);
                          },
                          icon: const Icon(Icons.directions_car_rounded),
                          label: const Text(
                            "ขอเส้นทาง",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
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
                      ),
                    ],
                  )
                ],
              ),
              isThreeLine: true,
            ),
          )),
          Expanded(
            child: FutureBuilder(
              future: ListShopPhoto(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return PhotoViewGallery.builder(
                      itemCount: imgs.length,
                      builder: (context, index) {
                        final urlIma = imgs[index]['imgs'];
                        // ignore: avoid_print
                        print(urlIma);
                        return PhotoViewGalleryPageOptions(
                          imageProvider: NetworkImage(urlIma),
                          minScale: PhotoViewComputedScale.contained,
                          maxScale: PhotoViewComputedScale.contained * 4,
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      )),
    );
  }
}
