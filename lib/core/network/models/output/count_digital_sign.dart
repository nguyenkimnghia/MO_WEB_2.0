import 'dart:convert';

CountDigitalSign countDigitalSignFromJson(String str) => CountDigitalSign.fromJson(json.decode(str));

String countDigitalSignToJson(CountDigitalSign data) => json.encode(data.toJson());

class CountDigitalSign {
  const CountDigitalSign({
    this.submitSign = const InfoSign(),
    this.approvalSign = const InfoSign(),
    this.sign = const InfoSign(),
    this.flashSign = const InfoSign(),
    this.promulgate = const InfoSign(),
  });

  final InfoSign submitSign; // Trình ký
  final InfoSign approvalSign; // Xét duyệt
  final InfoSign sign; // Ký duyệt
  final InfoSign flashSign; // Ký nháy
  final InfoSign promulgate; // Ban hành

  factory CountDigitalSign.fromJson(Map<String, dynamic> json) => CountDigitalSign(
    submitSign: InfoSign.fromJson(json["submitSign"]),
    approvalSign: InfoSign.fromJson(json["approvalSign"]),
    sign: InfoSign.fromJson(json["sign"]),
    flashSign: InfoSign.fromJson(json["flashSign"]),
    promulgate: InfoSign.fromJson(json["promulgate"]),
  );

  Map<String, dynamic> toJson() => {
    "submitSign": submitSign.toJson(),
    "approvalSign": approvalSign.toJson(),
    "sign": sign.toJson(),
    "flashSign": flashSign.toJson(),
    "promulgate": promulgate.toJson(),
  };
}

class InfoSign {
   const InfoSign({
    this.title = "",
    this.count = 0,
  });

  final String title;
  final int count;

  factory InfoSign.fromJson(Map<String, dynamic> json) => InfoSign(
    title: json["title"] ?? "",
    count: json["count"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "count": count,
  };
}
