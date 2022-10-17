import 'package:equatable/equatable.dart';
import 'package:moffice_web/core/network/models/model.export.dart';

class MainPageState extends Equatable {

  bool busy;
  final CountDigitalSign countDigitalSign;
  final DocumentCountModel documentCountModel;

  MainPageState({
    this.busy = true,
    this.countDigitalSign = const CountDigitalSign(),
    this.documentCountModel = const DocumentCountModel()
  });

  MainPageState copyWith({
    bool? busy,
    CountDigitalSign? countDigitalSign,
    DocumentCountModel? documentCountModel
  }) {
    return MainPageState(
      busy: busy ?? this.busy,
      countDigitalSign: countDigitalSign ?? this.countDigitalSign,
      documentCountModel: documentCountModel ?? this.documentCountModel,
    );
  }

  @override
  List<Object?> get props => [busy, countDigitalSign, documentCountModel];
}
