import 'dart:convert';

class BodyCommonParams {
  final String? data; // dữ liệu gửi lên ở body đã được mã hoá
  final String? strPublicKey;
  final String? aesKey;
  BodyCommonParams({
    this.data,
    this.strPublicKey,
    this.aesKey,
  });

  BodyCommonParams copyWith({
    String? data,
    String? strPublicKey,
    String? aesKey,
  }) {
    return BodyCommonParams(
      data: data ?? this.data,
      strPublicKey: strPublicKey ?? this.strPublicKey,
      aesKey: aesKey ?? this.aesKey,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data,
      'strPublicKey': strPublicKey,
      'aesKey': aesKey,
    };
  }

  factory BodyCommonParams.fromMap(Map<String, dynamic> map) {
    return BodyCommonParams(
      data: map['data'],
      strPublicKey: map['strPublicKey'],
      aesKey: map['aesKey'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BodyCommonParams.fromJson(String source) =>
      BodyCommonParams.fromMap(json.decode(source));

  @override
  String toString() =>
      'BodyCommonParams(data: $data, strPublicKey: $strPublicKey, aesKey: $aesKey)';
}
