import 'package:equatable/equatable.dart';

abstract class ItemMenuEvent extends Equatable {}

class ExpandMenu extends ItemMenuEvent {

  final bool expandMenu;

  ExpandMenu({required this.expandMenu});

  @override
  List<Object?> get props => [expandMenu];
}

class SelectItem extends ItemMenuEvent {

  final int indexSelected;

  SelectItem({required this.indexSelected});

  @override
  List<Object?> get props => [indexSelected];
}
