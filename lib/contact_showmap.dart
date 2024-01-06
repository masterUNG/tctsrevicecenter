// ignore: unused_import
import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ShowMaps extends StatefulWidget {
  const ShowMaps({Key? key}) : super(key: key);

  @override
  State<ShowMaps> createState() => _ShowMapsState();
}

class _ShowMapsState extends State<ShowMaps> {
  late double latU, lngU;
  @override
  void initState() {
    super.initState();
    fLatLng();
  }

  Future<void> fLatLng() async {
    LocationData? locationData = await fLocationData();
    latU = locationData!.latitude!;
    lngU = locationData.longitude!;
    // ignore: avoid_print
    print('lat : $latU long : $lngU'); // GET LOCATION
  }

  Future<LocationData?> fLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  // ignore: non_constant_identifier_names
  Marker ShopMaker() {
    return Marker(
      // ignore: prefer_const_constructors
      markerId: MarkerId('Shop'),
      // ignore: prefer_const_constructors
      position: LatLng(13.7269072, 100.6042062),
      icon: BitmapDescriptor.defaultMarkerWithHue(1),
      // infoWindow: InfoWindow(title: 'ร้านค้าของคุณ'),
    );
  }

  Set<Marker> mySet() {
    // ignore: prefer_collection_literals
    return <Marker>[ShopMaker()].toSet();
  }

  // ignore: non_constant_identifier_names
  Container Shomaps() {
    // ignore: prefer_const_constructors
    LatLng latlng = LatLng(13.7269072, 100.6042062);
    CameraPosition cameraposition = CameraPosition(target: latlng, zoom: 10.0);
    // ignore: sized_box_for_whitespace
    return Container(
      height: 250,

      // ignore: unnecessary_null_comparison
      child: GoogleMap(
        myLocationEnabled: true,
        initialCameraPosition: cameraposition,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          controller.setMapStyle(Utils.mapStyle);
        },
        markers: mySet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shomaps(),
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
