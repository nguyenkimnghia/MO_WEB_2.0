import 'dart:io';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<String> makeDirectory(String path) async {
    Directory directory = Directory("${await pathFolderApp()}/$path");
    if (directory.existsSync()) {
      return directory.path;
    } else {
      await directory.create(recursive: true);
    }
    return directory.path;
  }

  static Future<File> storeFileByByte(
      String path, String name, List<int> bytes) async {
    final file = File('$path/$name');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  static deleteFile(String path) async {
    File file = File("${await pathFolderApp()}/$path");
    if (!file.existsSync()) {
      throw Exception("This file is not exists");
    } else {
      file.delete(recursive: true);
    }
  }

  static deleteFolder(String path) async {
    Directory directory = Directory("${await pathFolderApp()}/$path");
    if (directory.existsSync()) {
      await directory.delete(recursive: true);
    }
  }

  /*{
    getFileSizeString
     - KB -> MB String
  }*/
  static String getFileSizeString(double fileSize) {
    int divider = 1024;
    return '${(fileSize / (divider * divider)).toStringAsFixed(2)} MB';
  }

  static Future<String> pathFolderApp() async =>
      "${(await getApplicationDocumentsDirectory()).path}/${IdentifierConst.saveFileFolder}";
}
