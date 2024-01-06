// ignore: unused_import
// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import, avoid_unnecessary_containers, deprecated_member_use

import 'dart:async';
import 'dart:convert';
// ignore: unused_import
import 'dart:ffi';

// ignore: unused_import
import 'package:tctservicecenter/constants.dart';
import 'package:tctservicecenter/phone.dart';
import 'package:tctservicecenter/contact_shop.dart';
// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact_customer.dart';
import 'contact_showmap.dart';
import 'contact_use.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: kPrimaryColor,
          bottom: TabBar(
            indicatorColor: Colors.red,
            labelColor: kBackgroundColor,
            labelStyle: TextStyle(fontSize: 11),

            unselectedLabelStyle:
                TextStyle(fontSize: 9, color: kBackgroundColor),
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              Tab(
                text: "เกี่ยวกับเรา",
                // icon: Icon(Icons.corporate_fare),
                icon: Icon(Icons.assured_workload_sharp),
              ),
              Tab(
                  text: "ข้อมูลติดต่อ",
                  icon: Icon(Icons.contact_phone_outlined)),
              Tab(
                  text: "บริษัทในเครื่อ",
                  icon: Icon(Icons.domain_add_outlined)),
              Tab(text: "สาขา", icon: Icon(Icons.storefront)),
            ],
          ),
          title: Text(
            'ติดต่อเรา',
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
        body: TabBarView(
          children: [
            Abount(),
            ContactUs(),
            contactcus(),
            shops(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container Abount() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "ผู้นำองค์กร",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    '"คุณชองทอง ซิ"',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'ประธานใหญ่ บริษัท ทีซีที เอสเซสโซรี่ จำกัด',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Image.asset(
              "images/tong-01.png",
              height: 250,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                "ทีซีที่กรุ๊ป ผู้นำด้านระบบรักษาความปลอดภัย",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "บริษัท ทีซีที กรุ๊ป ก่อตั้งขึ้นโดยคุณชอง ทอง ซิ ในปี 2537 ที่เรียกได้ว่าเป็นยุคทองของคอมพิวเตอร์ เขาจึงเลือกเริ่มต้นธุรกิจด้วยการนำเข้าอุปกรณ์เสริมของคอมพิวเตอร์ เพื่อเลือกสรรสิ่งที่ดีที่สุดให้กับผู้บริโภค แน่นอนว่าถ้าคิดจะทำธุรกิจเกี่ยวกับเทคโนโลยีต้องพัฒนาตนเองและเรียนรู้สิ่งใหม่ตลอดเวลา ทางบริษัทมีการติดต่อสื่อสารกับพันธมิตรทางธุรกิจผ่านกล้องเว็บแคมที่สามารถพูดคุยกับได้เหมือนกับวีดิโอคอลหรือสไกป์ในปัจจุบัน ด้วยเหตุนี้เองคุณชอง ทอง ซิ จึงมีแหล่งข้อมูลข่าวสารที่กว้างขวางและมากกว่าหลาย ๆ คน รวมถึงเรื่องของ ‘กล้องวงจรปิด’ เทคโนโลยีด้านความปลอดภัยที่น่าสนใจ มีความสำคัญและเป็นประโยชน์ต่อทุกครอบครัวด้วย เขาจึงตัดสินใจให้บริการกล้องวงจรปิดที่มีคุณภาพ ภายใต้ตราสินค้า ‘วาตาชิ (WATASHI)’ มาจนถึงปัจจุบัน",
              style: TextStyle(
                fontSize: 9,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(
                    "images/b1.png",
                    width: 150,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "ปัจจุบันเทคโนโลยีได้เข้ามาเป็นส่วนสำคัญในชีวิตประจำวันของเราทุกคน โดยเฉพาะเทคโนโลยีในเรื่องการรักษาความปลอดภัยประเภทกล้องวงจรปิด ด้วยประสบการณ์กว่า 10 ปี ของกลุ่มบริษัท ทีซีที กรุ๊ป ภายใต้ตราสินค้า วาตาชิ ทำให้ลูกค้าทั่วไปมั่นใจได้ว่า เราเป็นผู้นำสินค้าทางด้าน ระบบรักษาความปลอดภัยแบบครบวงจร มีสินค้าที่มีคุณภาพ และการพัฒนาเทคโนโลยีให้ทันสมัยอยู่ตลอดเวลา รวมทั้งความพร้อมในเรื่องทีมงานหลังบริการด้านการขาย มีเบอร์โทรศัพท์ Call Center 1795 เพื่อรองรับความต้องการและให้คำปรึกษาแนะนำเบื้องต้น รวมทั้งสร้างตราสินค้าผ่านตัวแทนจำหน่ายทั่วประเทศ",
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "อีกทั้งกลุ่มบริษัท ทีซีที กรุ๊ป ยังมีสินค้า Accessories Computer ภายใต้ตราสินค้า Dtech และ กระเป๋า WXD ที่กลุ่มบริษัท ทีซีที กรุ๊ป ได้คัดสรรมาเพื่อตอบสนองความต้องการ ให้ตรงกับกลุ่มเป้าหมายให้มากที่สุดไม่ว่าจะเป็น เทคโนโลยีที่ทันสมัย, คุณภาพสินค้า รวมทั้งราคาที่ยุติธรรม และยังทำส่งเสริมการขายร่วมกับพันธมิตรทางการค้า ควบคู่กับการประชาสัมพันธ์สินค้าในกลุ่มบริษัท ทีซีที กรุ๊ป ให้เป็นที่รู้จัก และเป็นที่ต้องการของตลาดมากขึ้นตามแนวความคิดปรัชญาการทำงานที่เรายึดถือมา โดยตลอด",
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                ),
                Container(
                  child: Image.asset(
                    "images/b2.jpg",
                    width: 150,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "วิสัยทัศน์",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ),
            Text(
                "เป็นผู้นำด้านไอทีเอสเซสโซรี่และผลิตภัณฑ์รักษาความปลอดภัย ในประเทศไทยและสากล จัดจำหน่ายได้ครอบคลุมทั่วประเทศ มีลูกค้าที่มีการซื้อ-ขายอย่างต่อเนื่องมากกว่า 100,000 ราย ด้วยประสบการณ์กว่า 20 ปี ของกลุ่มบริษัท TCT Group ภายใต้ตราสินค้า WATASHI ทำให้มั่นใจได้ว่าเราเป็นผู้นำทางด้านระบบรักษาความปลอดภัยแบบครบวงจร มีความพร้อมในเรื่องทีมงานบริการหลังการขาย มีเบอร์โทรศัพท์ Call center 1795 ที่ให้บริการตลอด 24 ชั่วโมง เพื่อรองรับความต้องการของลูกค้า ให้คำปรึกษาแนะนำและมีตัวแทนจำหน่ายทั่วประเทศ",
                style: TextStyle(fontSize: 9)),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "ปรัชญาองค์กร",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ),
            Text(
                "ดำเนินธุรกิจด้วยความซื่อสัตย์ ยกระดับเทคโนโลยีด้านความปลอดภัย เป็นที่น่าไว้วางใจและเชื่อถือได้",
                style: TextStyle(fontSize: 9)),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "พันธกิจ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ),
            Text(
                "ก้าวทันเทคโนโลยีด้านความปลอดภัย อำนวยความสะดวกให้ด้วยใจบริการ ตามความต้องการของลูกค้า ด้วยทีมงานที่เปี่ยมศักยภาพ",
                style: TextStyle(fontSize: 9)),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ListView ContactUs() {
    return ListView(children: [
      Container(
        child: Container(
          color: kBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                Text(
                  "บริษัท ทีซีที เอสเซสโซ จำกัด (สำนักงานใหญ่)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: kPrimaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  "images/tct.jpg",
                  width: 110,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "ที่ตั้งสำนักงาน",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    Text(
                      "สำนักงานใหญ่ เลขที่ 3 ถนนพัฒนาการ ซอยพัฒนาการ 20 แยก 5 แขวงสวนหลวง เขตสวนหลวง กรุงเทพมหานคร 10250",
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "เวลาทำการ",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    Text(
                      "จันทร์ - เสาร์ เวลา 8.30น. - 18.00น.",
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "เบอร์ติดต่อ",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    Text(
                      "02-318-8899",
                      style: TextStyle(fontSize: 11),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Hotline",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    Text(
                      "1795",
                      style: TextStyle(fontSize: 11),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Social",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Image.asset(
                              "images/button1.png",
                            ),
                            onTap: () {
                              String googleUrl1 = "https://tct.co.th/";
                              // ignore: deprecated_member_use
                              launch(googleUrl1);
                            },
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 2, right: 2),
                              child: InkWell(
                                child: Image.asset(
                                  "images/button2.png",
                                ),
                                onTap: () {
                                  String googleUrl2 =
                                      "https://www.facebook.com/tctaigroup.official";
                                  // ignore: deprecated_member_use
                                  launch(googleUrl2);
                                },
                              )),
                        ),
                        Expanded(
                          child: InkWell(
                            child: Image.asset(
                              "images/button3.png",
                            ),
                            onTap: () {
                              String googleUrl3 = "https://lin.ee/XlsbAQt";
                              // ignore: deprecated_member_use
                              launch(googleUrl3);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
      Container(
        color: Colors.white,
        child: Image.asset(
          "images/alllogo.png",
          fit: BoxFit.fitWidth,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                launch('tel:023188899');
              },
              icon: const Icon(Icons.phone),
              label: const Text(
                "โทรหาร้านค้า",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                // ignore: deprecated_member_use
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
                      "https://www.google.com/maps/search/?api=1&query=13.7269072,100.6042062";
                  launch(googleUrl);
                },
                icon: const Icon(Icons.directions_car_rounded),
                label: const Text(
                  "ขอเส้นทาง",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
        ),
      )
    ]);
  }
}
