part of 'locazation_bloc.dart';

abstract class LocazationEvent extends Equatable {
  const LocazationEvent();

  @override
  List<Object> get props => [];
}

class LocazationChangeLang extends LocazationEvent {
  final String lang;
  final bool isVi;
  const LocazationChangeLang({
    required this.lang,
    required this.isVi
  });

  @override
  List<Object> get props => [lang, isVi];

  LocazationChangeLang copyWith({
    String? lang,
    bool? isVi,
  }) {
    return LocazationChangeLang(
      lang: lang ?? this.lang,
      isVi: isVi ?? this.isVi,
    );
  }
}
