import 'dart:convert';

/// [DocumentCountModel] thông tin số lượng văn bản
class DocumentCountModel {
  final int receivedDocument; // Tất cả văn bản nhận được
  final int unreadDocument; // Số văn bản chưa đọc
  final int transferDocument; // Văn bản đã chuyển

  const DocumentCountModel({
      this.receivedDocument = 0,
      this.unreadDocument = 0,
      this.transferDocument = 0});

  DocumentCountModel copyWith({int? receivedDocument, int? unreadDocument, int? transferDocument}) {
    return DocumentCountModel(
        receivedDocument: receivedDocument ?? this.receivedDocument,
        unreadDocument: unreadDocument ?? this.unreadDocument,
        transferDocument: transferDocument ?? this.transferDocument);
  }

  Map<String, dynamic> toMap() {
    return {
      'allDocument': receivedDocument,
      'unreadDocument': unreadDocument,
      'transferDocument': transferDocument
    };
  }

  factory DocumentCountModel.fromMap(Map<String, dynamic> json) {
    return DocumentCountModel(
      receivedDocument: json['allDocument']?.toInt() ?? 0,
      unreadDocument: json['unreadDocument']?.toInt() ?? 0,
      transferDocument: json['transferDocument']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentCountModel.fromJson(String source) =>
      DocumentCountModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DocumentCountModel(allDocument: $receivedDocument, unreadDocument: $unreadDocument, transferDocument: $transferDocument)';
  }
}
