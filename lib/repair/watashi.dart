// ignore: unused_import
import 'dart:ffi';

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class watashis extends StatelessWidget {
  const watashis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      "images/__watashi.png",
                      width: 150,
                    ),
                    const Text(
                      "ข้อตกลงและเงือนไขการรับประกันสินค้า Watashi\n",
                      style: kTextHeadB,
                    ),
                  ],
                )),
            const Text(
              "1. การรับประกันนี้ไม่คลอบคลุมถึงสินค้า หรือชิ้นส่วนใดๆ ที่ขัดข้องชำรุดเสียหายอันเนื่องมาจาก",
              style: kTextHead,
            ),
            const Text(
                "• มีสภาพผิดปกติทางรูปทรง ได้แก่ แตก ,หัก,บิ่น,งอ,ยุบ,เบี้ยว,ร้าว,ทะลุ, บางส่วนที่หายไป",
                style: kTextSub),
            const Text(
                "• สินค้าถูกแก้ไข เปลี่ยนแปลง หรือ ซ่อมโดยบุคคลอื่น ที่ไม่ใช่ศูนย์บริการบริษัทฯ",
                style: kTextSub),
            const Text(
                "• ความเสียหายเนื่องจากภัยธรรมชาติ เช่น น้ำท่วม ฟ้าผ่า ไฟไหม้",
                style: kTextSub),
            const Text(
                "• สินค้าถูกใช้อย่างผิดวิธี หรือ มีการเก็บรักษา ที่ไม่ถูกต้อง หรือเกิดอุบัติเหตุกับตัวสินค้า",
                style: kTextSub),
            const Text("• Serial number ของสินค้าถูกแก้ไข หรือถูกเปลี่ยน",
                style: kTextSub),
            const Text(
                "• Void Warranty ไม่อยูในสภาพสมบูรณ์ มีรอยฉีก,ขาด,หลุด,หาย,ลบ,แก้ไข หรือถูกปิดทับจนไม่สามารถมองเห็นสาระสำคัญบนตัว\n",
                style: kTextSub),
            const Text("สติ๊กเกอร์", style: kTextHead),
            const Text("• ความเสียหายอันเกิดจากการต่ออุปกรณ์ต่อพ่วง",
                style: kTextSub),
            const Text(
                "• สินค้าเสียหายเนื่องจากปัจจัยภายนอกเช่น ไฟตก ไฟเกิน เป็นต้น",
                style: kTextSub),
            const Text(
                "• สินค้าเสียหายอันเกิดจากการลุกไหม้ของแผงวงจรหรืออุปกรณ์ ชิ้นส่วนของสินค้า ที่ไม่ได้มีสาเหตุมาจากความผิดพลาดในการผลิต\n",
                style: kTextSub),
            const Text(
                "2. การรับประกันจะสิ้นสุดลงทันทีเมื่อเกิดความเสียหายตามข้อ 1.",
                style: kTextHead),
            const Text("ระยะเวลาในการเปลี่ยนสินค้าตัวใหม่", style: kTextRem),
            const Text(
                "บริษัทฯจะเปลี่ยนสินค้าตัวใหม่ภายใน 7 วัน หรือ 1 เดือน(ขึ้นอยู่กับประเภทและชนิดของสินค้า)ตามเงื่อนไข ดังนี้",
                style: kTextRem),
            const Text("• สินค้าเกิดความบกพร่องของผู้ผลิตเอง", style: kTextSub),
            const Text(
                "• เป็นการรับประกันเฉพาะตัวสินค้าเท่านั้น ไม่รวมอุปกรณ์ที่แถมไปกับตัวสินค้า",
                style: kTextSub),
            const Text(
                "• ตัวสินค้าจะต้องอยู่ในสภาพที่สมบูรณ์ ห้าม แตก หัก ร้าว หรือ มีรอย ใด ๆ ทั้งสิ้น",
                style: kTextSub),
            const Text(
                "• ผู้ซื้อจะต้องแสดงใบเสร็จรับเงิน/ใบกำกับภาษีเพื่อใช้เป็นหลักฐานแสดงวันที่ซื้อสินค้า\n",
                style: kTextSub),
            const Text("เงื่อนไขการรับประกัน", style: kTextHead),
            const Text(
                "รับประกัน 3 ปี สำหรับ กล้องวงจรปิดวาตาชิทุกรุ่น ยกเว้น สินค้าเงื่อนไขพิเศษ สินค้าลดล้างสต๊อก (เฉพาะกล้องวงจรปิด ไม่รวม DVR และอุปกรณ์เสริมอื่นๆ) ภายใต้เงื่อนไข",
                style: kTextSub),
            const Text("* 2 ปี แรก รับประกันฟรีค่าแรง* และค่าอะไหล่",
                style: kTextHead),
            const Text("* ปีที่3 รับประกันฟรีเฉพาะค่าแรง* ไม่รวมค่าอะไหล่",
                style: kTextHead),
            const Text(
                "** ค่าแรง หมายถึง ค่าแรงช่างเทคนิคซ่อมสินค้าสำหรับงานซ่อมสินค้าไม่รวมถึงค่าบริการในการถอดเปลี่ยนสินค้านอก สถานที่ติดตั้งและไม่รวมค่าขนส่งสินค้า (ลูกค้าจะต้องเป็นฝ่ายรับผิดชอบในค่าใช้จ่ายดังกล่าว) รับประกัน 2 ปี สำหรับ เครื่องบันทึกวาตาชิทุกรุ่น ยกเว้น สินค้าเงื่อนไขพิเศษ สินค้าลดล้างสต๊อก รับประกัน 6 เดือน สำหรับอะแคปเตอร์ที่แถมไปกับตัวสินค้า ยกเว้น สินค้าเงื่อนไขพิเศษ สินค้าลดล้างสต๊อกรับประกัน 1 ปีสำหรับ กล้อง WIFI, สินค้า IOT, อะแคปเตอร์ที่ลูกค้าซื้อ แยกจากตัวสินค้า รวมทั้งสินค้าอื่น ๆทั่วไป ยกเว้น สินค้าเงื่อนไขพิเศษ สินค้าลดล้างสต๊อก",
                style: kTextRem),
            const Text(""),
            const Text(""),
            const Text(""),
            const Text(""),
          ],
        ),
      ),
    );
  }
}
