import 'dart:convert';

class SearchEmplParams {
  /// [keyWord] từ khoá
  final String keyWord;

  /// [SearchEmplParams] Param cho phần search employee
  SearchEmplParams({required this.keyWord});

  SearchEmplParams copyWith({String? keyWord}) {
    return SearchEmplParams(keyWord: keyWord ?? this.keyWord);
  }

  Map<String, dynamic> toMap() {
    return {'keyWord': keyWord};
  }

  factory SearchEmplParams.fromMap(Map<String, dynamic> map) {
    return SearchEmplParams(keyWord: map['keyWord'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory SearchEmplParams.fromJson(String source) =>
      SearchEmplParams.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SearchEmplParams(keyWord: $keyWord)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchEmplParams && other.keyWord == keyWord;
  }

  @override
  int get hashCode {
    return keyWord.hashCode;
  }
}