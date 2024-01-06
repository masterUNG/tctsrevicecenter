import 'package:tctservicecenter/constants.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class wartext extends StatelessWidget {
  const wartext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3))
              ],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset("images/Warranty_banner.jpg"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
              'เงื่อนไขการรับประกันสินค้าฉบับย่อ (English translation below):',
              style: kTextHead),
          const Text(
              "กล้องวงจรปิดวาตาชิ ทุกรุ่น รับประกัน 3 ปี เต็ม ยกเว้นสินค้าราคาพิเศษ ( เงื่อนไขประกัน เฉพาะกล้องวงจรปิด ไม่รวม DVR และอุปกรณ์เสริมอื่นๆ ) ภายใต้เงื่อนไขที่กำหนด*\n",
              style: kTextSub),
          const Text("รายละเอียดการรับประกันเพิ่มเติม", style: kTextHead),
          const Text(
              "2 ปีแรก รับประกัน ฟรี ค่าแรง• และค่าอะไหล่  ปีที่ 3 รับประกัน ฟรี เฉพาะค่าแรง• ไม่รวมค่าอะไหล่ *ค่าแรง หมายถึง ค่าแรงช่างเทคนิคซ่อมสินค้าสำหรับงานซ่อมสินค้า ไม่รวมถึงค่าบริการในการถอด เปลี่ยนสินค้า ณ สถานที่ติดตั้ง และไม่รวมค่าขนส่งสินค้า (ลูกค้าเป็นผู้รับผิดชอบค่าใช้จ่ายดังกล่าว) ระยะเวลาการรับประกัน : เครื่อง DVR รับประกัน 2 ปี\n",
              style: kTextSub),
          const Text(
              "บริษัทฯจะเปลี่ยนสินค้าตัวใหม่ภายใน 7  วัน หรือ 1 เดือน(ขึ้นอยู่กับประเภทและชนิดของสินค้า)ตามเงื่อนไข ดังนี้",
              style: kTextHead),
          const Text(
              "• สินค้าเกิดความบกพร่องของผู้ผลิตเอง\n• เป็นการรับประกันเฉพาะตัวสินค้าเท่านั้น\n• ตัวสินค้าจะต้องอยู่ในสภาพที่สมบูรณ์ ห้าม แตก หัก ร้าว หรือ มีรอย ใด ๆ ทั้งสิ้น\n• ผู้ซื้อจะต้องแสดงใบเสร็จรับเงิน/ใบกำกับภาษีเพื่อใช้เป็นหลักฐานแสดงวันที่ซื้อสินค้า\n",
              style: kTextSub),
          const Text("Warranty Terms (Summary)", style: kTextHead),
          const Text(
              "Three year warranty is for all CCTV cameras, except cameras bought at a special price. (CCTV only, excludes DVR devices or other accessories.)\n",
              style: kTextSub),
          const Text(
              "First two years - Labor• is free of charge, including spare parts.Third year - Labor• is free of charge, excluding spare parts.\n",
              style: kTextSub),
          const Text(
              "*Labor refers to wages paid to repair technicians for repair work on your product.  Does not include installation costs or shipping. (Customer is liable for these expenses.)\n",
              style: kTextSub),
          const Text("Product Guarantee:", style: kTextHead),
          const Text(
              "1. This warranty does not comprehensively cover the product or any piece of the product if damage is a result of any of the following:\n",
              style: kTextSub),
          const Text(
              "• The product is abnormally shaped due to having been: damaged, chipped, bent, crushed, deformed, cracked, punctured, or missing pieces",
              style: kTextSub),
          const Text(
              "• The product is modified, changed, or repaired by someone other than the company’s service center",
              style: kTextSub),
          const Text(
              "• The product is damaged due to natural disasters such as flooding, lightning, or fire",
              style: kTextSub),
          const Text(
              "• The product is used or stored incorrectly, or it was involved in an accident.",
              style: kTextSub),
          const Text("• The product’s serial number is modified or changed",
              style: kTextSub),
          const Text(
              "• The product’s warranty is voided if any part is torn, missing, erased, modified, or covered so that the information on the sticker cannot be seen",
              style: kTextSub),
          const Text(
              "• The product is damaged due to connections with outside devices",
              style: kTextSub),
          const Text(
              "• The product is damaged due to external factors such as fire, lightning, flood, etc",
              style: kTextSub),
          const Text(
              "• The product is damaged by a circuit board or device fire caused by something other than a production error\n",
              style: kTextSub),
          const Text(
              "2. The product’s warranty ends immediately in any of the aforementioned situations\n",
              style: kTextSub),
          const Text("New Product Replacement Period\n", style: kTextHead),
          const Text(
              "The company will replace the product within 7 days or 1 month (depending on the category and type of product) as follows:\n",
              style: kTextSub),
          const Text("• The product has a manufacturing defect",
              style: kTextSub),
          const Text("• The product has met the criteria for the warranty",
              style: kTextSub),
          const Text(
              "• The product must be in perfect condition, without damage, cracks, or scratches",
              style: kTextSub),
          const Text(
              "• The buyer must show the receipt or tax invoice as proof of date of purchase\n",
              style: kTextSub),
          const Text(
              "Additional: Terms for Replacing Products Within 1 Month\n",
              style: kTextHead),
          const Text(
              "1. In the case that the product is damaged and cannot be used, customers can exchange the product within one month of the date of purchase under the following conditions:\n",
              style: kTextSub),
          const Text(
              "• Only valid for CCTV products and recorder.  Excludes accessories",
              style: kTextSub),
          const Text(
              "• Only valid for predetermined models.  Excludes products purchased under stock clearance or with special conditions",
              style: kTextSub),
          const Text(
              "• Only valid for products that cannot be used due to manufacturing defects\n",
              style: kTextSub),
          const Text("2.  Exceptions that do not qualify for replacement/n",
              style: kTextSub),
          const Text(
              "• Product is damaged and does not operate correctly due to abnormalities in shape, including having been: damaged, chipped, bent, crushed, deformed, cracked, punctured, or missing pieces",
              style: kTextSub),
          const Text(
              "• The product is modified, changed, or repaired by someone other than the company’s service center",
              style: kTextSub),
          const Text(
              "• The product is damaged due to natural disasters like flooding, lightning, or fire",
              style: kTextSub),
          const Text(
              "• The product is used or stored incorrectly, or it was involved in an accident.",
              style: kTextSub),
          const Text("• The product’s serial number is modified or changed",
              style: kTextSub),
          const Text(
              "• The product’s warranty is voided if any part is torn, missing, erased, modified, or covered so that the information on the sticker cannot be seen",
              style: kTextSub),
          const Text(
              "• The product is damaged due to connections with outside devices",
              style: kTextSub),
          const Text(
              "• The product is damaged due to external factors such as fire, lightning, flood, etc",
              style: kTextSub),
          const Text(
              "• The product is damaged by a circuit board or device fire caused by something other than a production error\n",
              style: kTextSub),
          const Text(
              "3. The buyer must show the receipt or tax invoice as proof of date of purchase including the boxes with all the products and equipment inside the box being in perfect condition\n",
              style: kTextSub),
          const Text(
              "4. These conditions are only for products that are scheduled to be purchased on or after June 1, 2017\n",
              style: TextStyle(fontSize: 13)),
          const Text("", style: TextStyle(fontSize: 13)),
          const Text("", style: TextStyle(fontSize: 13)),
          const Text("", style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
