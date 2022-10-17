part of 'locazation_bloc.dart';

abstract class LocazationState extends Equatable {
  const LocazationState();

  @override
  List<Object> get props => [];
}

class LocazationInitial extends LocazationState {
  final String local;
  final bool isVi;
  final List<Language> supportedLanguages = [
    Language(code: 'US', locale: 'en', language: 'English'),
    Language(code: 'VI', locale: 'vi', language: 'VietNam'),
  ];

  LocazationInitial(this.local, this.isVi);

  LocazationInitial copyWith({
    String? local,
    bool? isVi,
  }) {
    return LocazationInitial(
      local ?? this.local,
      isVi ?? this.isVi,
    );
  }

  @override
  List<Object> get props => [local, isVi];
}

class Language {
  /// the country code (IT,AF..)
  String? code;

  /// the locale (en, es, da)
  String? locale;

  /// the full name of language (English, Danish..)
  String? language;

  /// map of keys used based on industry type (service worker, route etc)
  Map<String, String>? dictionary;

  Language({this.code, this.locale, this.language, this.dictionary});
}
