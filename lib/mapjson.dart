// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
    required this.cname,
    required this.addess,
    required this.province,
    required this.phone,
    required this.work,
    required this.lat,
    required this.lon,
    required this.detal,
    required this.img,
  });

  String id;
  String cname;
  String addess;
  String province;
  String phone;
  String work;
  String lat;
  String lon;
  String detal;
  String img;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        cname: json["cname"],
        addess: json["addess"],
        province: json["province"],
        phone: json["phone"],
        work: json["work"],
        lat: json["lat"],
        lon: json["lon"],
        detal: json["detal"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cname": cname,
        "addess": addess,
        "province": province,
        "phone": phone,
        "work": work,
        "lat": lat,
        "lon": lon,
        "detal": detal,
        "img": img,
      };
}
