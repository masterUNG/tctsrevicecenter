// ignore: duplicate_ignore

// ignore_for_file: camel_case_types, duplicate_ignore

import 'dart:convert';

// ignore: unused_import
import 'package:tctservicecenter/ants.dart';
import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dialog.dart';
import 'mapdetial.dart';
import 'mapsearch.dart';
// ignore: duplicate_import
import 'constants.dart';

// ignore: camel_case_types
class maps extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  maps({Key? key}) : super(key: key);

  @override
  State<maps> createState() => _mapsState();
}

class _mapsState extends State<maps> {
  late LocationData currentPosition;
  late GoogleMapController mapController;
  Location location = Location();

  // ignore: prefer_const_constructors
  LatLng initialcameraposition = LatLng(13.760183050581782, 100.49474376397019);
  late Marker marker;
  List<Marker> markers = <Marker>[];
  String myLocation = 'yes';
  String myLoadData = 'yes';
  late BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  late BitmapDescriptor customIconCar = BitmapDescriptor.defaultMarker;

  late double? lats;
  late double? logs;

  //MapType _currentMapType = MapType.normal;
  @override
  void initState() {
    super.initState();
    getLoc();
  }

  getLoc() async {
    // ignore: unnecessary_new
    Location location = new Location();
    myLocation = "yes";
    // ignore: no_leading_underscores_for_local_identifiers
    bool _serviceEnabled;
    // ignore: no_leading_underscores_for_local_identifiers
    PermissionStatus _permissionGranted;
    // ignore: unused_local_variable, no_leading_underscores_for_local_identifiers
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // ignore: use_build_context_synchronously
        return MyDialog().alertLocationService(
            context,
            'คุณยังไม่เปิด Service Location',
            'เพื่อขอใช้บริการกรุณาเปิด Service Location เพื่อรับบริการ');
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.deniedForever) {
        // ignore: use_build_context_synchronously
        return MyDialog().alertLocationService(
            context,
            'คุณยังไม่เปิด Share Location',
            'เพื่อขอใช้บริการกรุณาเปิด Share Location');
      }
    } else {
      if (_permissionGranted == PermissionStatus.deniedForever) {
        // ignore: use_build_context_synchronously
        return MyDialog().alertLocationService(
            context,
            'คุณยังไม่เปิด Share Location',
            'เพื่อขอใช้บริการกรุณาเปิด Share Location');
      }
    }

    currentPosition = await location.getLocation();
    double? latitude = currentPosition.latitude;
    double? longitude = currentPosition.longitude;

    location.onLocationChanged.listen((LocationData curtentLocation) {
      setState(() {
        lats = latitude!;
        logs = longitude!;
        // print(
        //
        //    'Current Loc ${currentPosition.latitude} : ${currentPosition.longitude}');
        initialcameraposition = LatLng(latitude, longitude);
        if (myLoadData == 'yes') {
          mapController.moveCamera(
            CameraUpdate.newLatLng(LatLng(latitude, longitude)),
          );

          myLoadData = 'no';
        }
        getMarker();
        setMarkers();
        // ignore: avoid_print
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    controller.setMapStyle(Utils.mapStyle);
    // ignore: avoid_print
    print(
        'oncreate ${initialcameraposition.latitude} : ${initialcameraposition.longitude}');
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: initialcameraposition, zoom: 12.3)));
  }

  createMatker(context) {
    if (myLocation == "yes") {
      // ignore: unused_local_variable
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
              // ignore: unnecessary_, prefer_const_constructors
              ImageConfiguration(),
              'images/maker.gif')
          .then((icon) => customIcon = icon);
    }
  }

  List makerList = [];
  // ignore: non_ant_identifier_names, unused_element
  Future<String> getMarker() async {
    var url = 'https://dtechthailand.com/appbase/mapget.php';
    try {
      var responese = await http.get(Uri.parse(url));
      // ignore: avoid_print
      if (responese.statusCode == 200) {
        makerList = json.decode(responese.body);
      }
      return makerList.toString();
    } catch (e) {
      return '';
    }

    // print(makerList);
    // ignore: avoid_print
  }

  setMarkers() {
    createMatker(context);

    for (var x = 0; x <= makerList.length - 1; x++) {
      var lat = double.parse(makerList[x]['lat']);
      var lng = double.parse(makerList[x]['lon']);

      // ignore: avoid_print
      //print(cnnames);

      var latLog = LatLng(lat, lng);
      markers.add(Marker(
        markerId: MarkerId("home$x"),
        //position: initialcameraposition, // ตามตำแหน่งที่อยู่
        position: latLog,
        icon: customIcon,
        // ignore: prefer_const_constructors
        infoWindow: InfoWindow(),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            // ignore: prefer__ructors
            builder: (context) => mapdetials(
              cname: makerList[x]['cname'],
              addess: makerList[x]['addess'],
              province: makerList[x]['province'],
              phone: makerList[x]['phone'],
              detal: makerList[x]['detal'],
              work: makerList[x]['works'],
              img: makerList[x]['img'],
              lat: makerList[x]['lat'],
              lng: makerList[x]['lon'],
            ),
          ),
        ),
      ));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "ศูนย์บริการใกล้ฉัน",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            // ignore: prefer_const_constructors
            icon: Icon(Icons.arrow_back)),
        actions: [
          Container(
            decoration: const BoxDecoration(
              // ignore: unnecessary_const
              color: const Color.fromRGBO(0, 33, 100, 1),
            ),
            child: IconButton(
              onPressed: () {
                // ignore: avoid_print
                print("$lats,$logs");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      // ignore: prefer_const_constructors
                      builder: (context) => mapsearchs(
                          lat: lats.toString(), lng: logs.toString()),
                    ));
              },
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.format_list_bulleted_sharp,
                size: 35,
                color: kBackgroundColor,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            //myLocationButtonEnabled: true,
            //zoomGesturesEnabled: true,
            //.0zoomControlsEnabled: true,
            initialCameraPosition:
                CameraPosition(target: initialcameraposition, zoom: 12.3),
            markers: Set<Marker>.of(markers),
            mapType: MapType.normal,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  backgroundColor: kPrimaryColor,
                  // ignore: prefer_const_constructors
                  child: Icon(Icons.gps_fixed_outlined),
                  onPressed: () {
                    mapController.moveCamera(
                      CameraUpdate.newLatLng(initialcameraposition),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class Utils {
  static String mapStyle = '''
[
  {
    "featureType": "administrative.country",
    "elementType": "labels.icon",
    "stylers": [
      {
        "weight": 1
      }
    ]
  },
  {
    "featureType": "poi.business",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road",
    "stylers": [
      {
        "lightness": 25
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "water",
    "stylers": [
      {
        "color": "#7accff"
      }
    ]
  }
]
''';
}
