import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mptest extends StatefulWidget {
  const Mptest({Key? key}) : super(key: key);

  @override
  State<Mptest> createState() => _MptestState();
}

class _MptestState extends State<Mptest> {
  // ignore: unnecessary_new
  Location location = new Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  // ignore: unused_field
  late LocationData _locationData;

  // ignore: prefer_void_to_null
  Future<Null> loc() async {
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
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loc();
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Showmap();
  }

  // ignore: non_constant_identifier_names
  Container Showmap() {
    // ignore: prefer_const_constructors
    LatLng latlng = LatLng(13.674307, 100.606692);
    CameraPosition cameraPosition = CameraPosition(target: latlng, zoom: 12);
    // ignore: sized_box_for_whitespace
    return Container(
      height: 300.0,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        myLocationEnabled: true,
      ),
    );
  }
}
