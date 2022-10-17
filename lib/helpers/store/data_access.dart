import 'package:moffice_web/helpers/store/shared_preferences.dart';

class DataAccess {

  // Config language
  static Future<void> saveLanguageCurrent(bool isVi) async{
    // save language current
    SharedPre.saveDataBool(SharedPre.isVi, isVi);
  }
  static Future<bool> getLanguageCurrent() async{
    // get language current
    bool isVi = await SharedPre.readDataBool(SharedPre.isVi) ;
    return isVi;
  }

}