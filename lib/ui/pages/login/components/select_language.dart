import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moffice_web/controllers/blocs/locazation/locazation.exports.dart';
import 'package:moffice_web/helpers/store/store.exports.dart';
import 'components.exports.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {

  @override
  void initState() {
    setLanguageSelected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<LocazationBloc, LocazationInitial>(
        builder: (context, locazationState){
          return Positioned(
            top: size.height * 0.02,
            right: 0,
            child: Row(
              children: [
                ItemLanguage(
                  textLanguage: "VI",
                  isVi: locazationState.isVi,
                  icon: ImagesNameConst.getIcon(ImagesNameConst.icVn),
                  tapEvent: () {
                    BlocProvider.of<LocazationBloc>(context).add(const LocazationChangeLang(lang: 'vi', isVi: true));
                    // save language selected
                    DataAccess.saveLanguageCurrent(true);
                  },
                ),
                ItemLanguage(
                  textLanguage: "ENG",
                  isVi: !locazationState.isVi,
                  icon: ImagesNameConst.getIcon(ImagesNameConst.icEng),
                  tapEvent: () {
                    BlocProvider.of<LocazationBloc>(context)
                        .add(const LocazationChangeLang(lang: 'en', isVi: false ));
                    // save language selected
                    DataAccess.saveLanguageCurrent(false);
                  },
                ),
              ],
            ),
          );
        });
  }

  void setLanguageSelected() async {
    try {
      bool isVi = await DataAccess.getLanguageCurrent();
      BlocProvider.of<LocazationBloc>(context).add(LocazationChangeLang(lang: isVi ? 'vi' : 'en', isVi: isVi ));
    } catch(e){
      e.toString();
    }
  }
}
