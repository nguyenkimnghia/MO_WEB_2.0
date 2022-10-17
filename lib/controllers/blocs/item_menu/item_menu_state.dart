import 'package:equatable/equatable.dart';

class ItemMenuState extends Equatable {

  // show view filter
  final bool expandMenu;
  // selected item
  final int indexSelected;

  const ItemMenuState({
    // show view filter
    this.expandMenu = false,
    this.indexSelected = -1,
  });

  ItemMenuState copyWith({
    // show view filter
    bool? expandMenu,
    int? indexSelected,
  }) {
    return ItemMenuState(
      // show more
      expandMenu: expandMenu ?? this.expandMenu,
      indexSelected: indexSelected ?? this.indexSelected,
    );
  }

  @override
  List<Object?> get props => [expandMenu, indexSelected];
}
