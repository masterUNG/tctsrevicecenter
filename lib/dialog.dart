import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

class MyDialog {
  final Function()? funcAction;

  MyDialog({this.funcAction});

  // ignore: prefer_void_to_null
  Future<Null> showProgressDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        // ignore: prefer_const_constructors
        child: Center(
            // ignore: prefer_const_constructors
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
        onWillPop: () async {
          return false;
        },
      ),
    );
  }

  // ignore: prefer_void_to_null
  Future<Null> alertLocationService(
      BuildContext context, String title, String message) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: Image.asset("images/slocation.gif"),
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
          subtitle: Text(message,
              style: const TextStyle(fontSize: 12, color: Colors.black38)),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              // Navigator.pop(context);
              // await Geolocator.openLocationSettings();
              // exit(0);
            },
            child: const Text('ตั้งค่า'),
          )
        ],
      ),
    );
  }

  // Future<Null> normalDialog(
  //     BuildContext context, String title, String message) async {
  //   showDialog(
  //     context: context,
  //     builder: (context) => SimpleDialog(
  //       title: ListTile(
  //         leading: ShowImage(path: MyConstant.image1),
  //         title: ShowTitle(title: title, textStyle: MyConstant().h2Style()),
  //         subtitle:
  //             ShowTitle(title: message, textStyle: MyConstant().h3Style()),
  //       ),
  //       children: [
  //         TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
  //       ],
  //     ),
  //   );
  // }

  // Future<Null> actionDialog(
  //   BuildContext context,
  //   String title,
  //   String message,
  // ) async {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: ListTile(
  //         leading: ShowImage(path: MyConstant.image1),
  //         title: ShowTitle(title: title, textStyle: MyConstant().h2Style()),
  //         subtitle:
  //             ShowTitle(title: message, textStyle: MyConstant().h3Style()),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: funcAction,
  //           child: Text('OK'),
  //         ),
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text('Cancel'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
