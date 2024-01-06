// ignore_for_file: camel_case_types, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class contactuse extends StatefulWidget {
  const contactuse({Key? key}) : super(key: key);

  @override
  State<contactuse> createState() => _contactuseState();
}

List brand = [];
// ignore: non_constant_identifier_names
Future<String> ListBrand() async {
  var url = 'https://dtechthailand.com/appbase/company_brand.php';

  var responese = await http.get(Uri.parse(url));
  // ignore: avoid_print
  if (responese.statusCode == 200) {
    brand = json.decode(responese.body);
  }
  // for (var u in promo) }
  //   getData.add(Note.fromJson(u));
  // }
  return brand.toString();
  // ignore: avoid_print
}

class _contactuseState extends State<contactuse> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: ListBrand(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // ignore: unused_local_variable
                double width = MediaQuery.of(context).size.width / 5;
                return GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 80,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    itemCount: brand.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        alignment: Alignment.center,
                        child: Image.network(
                          "https://dtechthailand.com/appwatashi/_img/brand/" +
                              brand[index]['img'],
                          fit: BoxFit.cover,
                        ),
                      );
                    });
              } else {
                // ignore: avoid_unnecessary_containers
                return Container(
                  // ignore: prefer_const_constructors
                  child: Center(
                    // ignore: prefer_const_constructors
                    child: CircularProgressIndicator(
                      // ignore: unnecessary_const, prefer_const_constructors
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
