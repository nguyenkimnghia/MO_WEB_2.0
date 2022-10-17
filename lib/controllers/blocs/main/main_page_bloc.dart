import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/core/network/repositories/repositories.exports.dart';
import 'main.exports.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final MainRepositories mainRepositories = MainRepositories();
  late CountDigitalSign countDigitalSign;
  late DocumentCountModel documentCountModel;


  MainPageBloc() : super(MainPageState()) {
    on<LoadDataHome>(_onLoadDataHome);
  }

  Future<void> _onLoadDataHome(LoadDataHome event, Emitter<MainPageState> emit) async{
    if (state.busy){
      try {
        await loadData();
        emit(state.copyWith(
            busy: false,
            countDigitalSign: countDigitalSign,
            documentCountModel: documentCountModel
        ));
      } catch(e){
        rethrow;
      }
    }
  }
  Future loadData() async {
    List<Future> futures = [];
    futures.add(_loadCountDigitalSign());
    futures.add(_loadCountDocument());
    await Future.wait(futures);

  }

  Future _loadCountDigitalSign() async {
    ResponseCommon response  = await mainRepositories.getCountDigitalSign();
    if (response.errorCode == NetworkConst.e000Success){
      countDigitalSign = countDigitalSignFromJson(response.data);
    }
  }

  Future _loadCountDocument() async {
    documentCountModel = await mainRepositories.getCountDocument();
  }
}

