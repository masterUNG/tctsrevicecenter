// ignore: unused_import
import 'dart:ffi';

import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class zks extends StatelessWidget {
  const zks({Key? key}) : super(key: key);

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
                      "images/__zk.png",
                      width: 150,
                    ),
                    const Text(
                      "ข้อตกลงและเงือนไขการรับประกันสินค้า ZK Teco\n",
                      style: kTextHeadB,
                    ),
                  ],
                )),
            const Text(
                "การรับประกันนี้เฉพาะสินค้าที่จัดจำหน่ายโดยบริษัท ทีซีที เอสเซสโซรี่ จำกัด เท่านั้น ภายใต้เงื่อนไข ดังนี้\n",
                style: kTextHead),
            const Text(
                "ข้อ 1. การรับประกันนี้ไม่ครอบคลุมถึงสินค้า หรือชิ้นส่วนใดๆ ที่ขัดข้องชำรุดเสียหายอันเนื่องมาจาก",
                style: kTextHead),
            const Text(
                "• มีสภาพผิดปกติทางรูปทรง ได้แก่ แตก , หัก, บิ่น, งอ, ยุบ, เบี้ยว, ร้าว, ทะลุ, บางส่วนที่หายไป",
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
                "• Void Warranty ไม่อยูในสภาพสมบูรณ์ มีรอยฉีก, ขาด, หลุด, หาย, ลบ, แก้ไข หรือถูกปิดทับจนไม่สามารถมองเห็นสาระสำคัญบนตัวสติ๊กเกอร์",
                style: kTextSub),
            const Text("• ความเสียหายอันเกิดจากการต่ออุปกรณ์ต่อพ่วง",
                style: kTextSub),
            const Text(
                "• สินค้าเสียหายเนื่องจากปัจจัยภายนอกเช่น กระแสไฟฟ้าตก กระแสไฟฟ้าเกิน เป็นต้น",
                style: kTextSub),
            const Text(
                "• สินค้าเสียหายอันเกิดจากการลุกไหม้ของแผงวงจรหรืออุปกรณ์ ชิ้นส่วนของสินค้า ที่ไม่ได้มีสาเหตุมาจากความผิดพลาดในการผลิต\n",
                style: kTextSub),
            const Text(
                "ข้อ 2. การรับประกันจะสิ้นสุดลงทันทีเมื่อเกิดความเสียหายตามข้อ 1.\n",
                style: kTextHead),
            const Text("ข้อ 3. ระยะเวลาในการเปลี่ยนสินค้าตัวใหม่",
                style: kTextHead),
            const Text(
                "บริษัทฯจะเปลี่ยนสินค้าตัวใหม่ภายใน 7 วัน หรือ 1 เดือน (ขึ้นอยู่กับประเภทและชนิดของสินค้า) ตามเงื่อนไข ดังนี้",
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
            const Text("ข้อ 4. เงื่อนไขและระยะเวลาการรับประกัน",
                style: kTextHead),
            const Text(
                "4.1 รับประกัน 2 ปี สินค้าประเภท Time Attendance, Access Control",
                style: kTextSub),
            const Text(
                "4.2 รับประกัน 1 ปี สินค้าประเภท Parking Barrier, Smart Lock, CCTV, Metal Detacter, Barrier, Adapter",
                style: kTextSub),
            const Text(
                "4.3 การรับประกันตาม ข้อ 4.1 และ 4.2 เฉพาะสินค้าราคาปกติ กรณีสินค้าราคาพิเศษ หรือสินค้าลดล้างสต๊อก อาจระบุเงื่อนไข และระยะเวลารับประกันที่แตกต่างออกไป โดยจะระบุไว้ในการซื้อขายสินค้านั้นๆ",
                style: kTextSub),
            const Text(
                "4.4 การรับประกันไม่รวมถึงค่าบริการในการถอด เปลี่ยนสินค้า ณ สถานที่ติดตั้ง(ลูกค้าจะต้องเป็นฝ่ายรับผิดชอบในค่าใช้จ่ายดังกล่าว)",
                style: kTextSub),
            const Text(
                "4.5 ค่าขนส่งสินค้าเคลม ลูกค้าจะเป็นฝ่ายรับผิดชอบเมื่อส่งสินค้าเคลม และเมื่อส่งสินค้าเคลมกับคืนลูกค้า บริษัทฯจะเป็นฝ่ายรับผิดชอบค่าขนส่งกรณีส่งคืนสินค้านั้น",
                style: kTextSub),
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
