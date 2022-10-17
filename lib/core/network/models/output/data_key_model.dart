class DataKeyModel {
  String strPublicKey;

  DataKeyModel(
      {required this.strPublicKey,});

  factory DataKeyModel.fromJson(Map<String, dynamic> json) => DataKeyModel(
        strPublicKey: json["strPublicKey"],
      );

  DataKeyModel copyWith({
    String? strPublicKey,
  }) {
    return DataKeyModel(
      strPublicKey: strPublicKey ?? this.strPublicKey,
    );
  }
}
