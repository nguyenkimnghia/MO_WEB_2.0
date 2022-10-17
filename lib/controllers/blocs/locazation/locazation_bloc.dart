import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'locazation_event.dart';
part 'locazation_state.dart';

class LocazationBloc extends Bloc<LocazationEvent, LocazationInitial> {
  LocazationBloc() : super(LocazationInitial('vi', true)){
    on<LocazationChangeLang>(_locazationChangeLang);
  }

  Future<void> _locazationChangeLang(LocazationChangeLang event, Emitter<LocazationInitial> emit) async {
    emit(state.copyWith(local: event.lang, isVi: event.isVi ));
  }
}
