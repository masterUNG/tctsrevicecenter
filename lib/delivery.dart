import 'package:flutter/material.dart';
import 'package:tctservicecenter/constants.dart';
import 'package:tctservicecenter/delivery_detail.dart';

class delivery extends StatefulWidget {
  const delivery({super.key});

  @override
  State<delivery> createState() => _deliveryState();
}

class _deliveryState extends State<delivery> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          centerTitle: false,
          title: const Text(
            "ตรวจสอบสถานะสินค้า",
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "ติดตามค้นหาสถานะสินค้า",
                    style: TextStyle(
                        fontSize: 16,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _textController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "เลขที่ใบเสนอราคา",
                        prefixIcon: Icon(Icons.assignment_turned_in_outlined),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    label: const Text('ตรวจสอบ'),
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => delivery_detail(
                                  search: _textController.text.toUpperCase())));
                    },
                    style: ElevatedButton.styleFrom(

                        // ignore: deprecated_member_use
                        primary: kPrimaryColor,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20)),
                  )
                ]),
          ),
        ));
  }
}
