import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moffice_web/controllers/blocs/item_menu/item_menu.exports.dart';

class ItemMenuBloc extends Bloc<ItemMenuEvent, ItemMenuState> {
  
  ItemMenuBloc() : super(const ItemMenuState()) {
    on<ExpandMenu>(_onShowMore);
    on<SelectItem>(_onSelectItem);
  }

  // Show more
  Future<void> _onShowMore(ExpandMenu event, Emitter<ItemMenuState> emit) async {
    emit (state.copyWith(expandMenu: event.expandMenu));
  }

  // action select item
  Future<void> _onSelectItem(SelectItem event, Emitter<ItemMenuState> emit) async {
    emit(state.copyWith(indexSelected: event.indexSelected));
  }
}
