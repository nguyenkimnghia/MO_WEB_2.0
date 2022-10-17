import 'package:equatable/equatable.dart';
abstract class SearchContactEvent extends Equatable{}

class SearchByKeyword extends SearchContactEvent {
  final String text;


  SearchByKeyword({required this.text});

  @override
  List<Object?> get props => [text];

}

class SelectContact extends SearchContactEvent {

  SelectContact({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}