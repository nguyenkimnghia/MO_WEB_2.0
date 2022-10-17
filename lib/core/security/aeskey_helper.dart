import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/helpers/store/store.exports.dart';


class AesKeyHelper {
  static String createAesKey() {
    IdentifierConst.mKey = convetToSHA256(createTokenRandom(), 32);
    IdentifierConst.mIV = generateRandomIV(16);
    // Save key
    StorageCached.localStorage.saveString(StorageCached.mKey, IdentifierConst.mKey);
    StorageCached.localStorage.saveString(StorageCached.mIV, IdentifierConst.mIV);

    return IdentifierConst.mKey + IdentifierConst.strVIAESKEYSPACE + IdentifierConst.mIV;
  }

  /// This function computes the SHA256 hash of input bytes
  /// input text whose SHA256 hash has to be computed
  /// length of the text to be returned
  /// @return returns SHA256 hash of input text
  static String convetToSHA256(Uint8List bytes, int count) {
    try {
      Digest digest = sha256.convert(bytes);

      String result = digest.toString(); // convert to hex
      if (count <= result.length) {
        result = result.toString().substring(0, count);
      }
      return result;
    } catch(e){
      return "";
    }
  }

  // tao token random
  static Uint8List createTokenRandom() {
    SecureRandom random = SecureRandom(20);
    Uint8List bytes = random.bytes;
    return bytes;
  }


  // this function generates random string for given length
  // Desired length
  static String generateRandomIV(int count) {
    SecureRandom ranGen =  SecureRandom(count);
    Uint8List bytes = ranGen.bytes;
    String result = Digest(bytes).toString();
    if (count <= result.length) {
      result = result.toString().substring(0, count);
    }
    return result;
  }

  // encrypt password
  static String encryptPassword (String plaintext){
    // thuc hien convet to byte
      List<int> bytes = utf8.encode(plaintext);
      // ma hoa sha1
      Digest digest = sha1.convert(bytes);
      // convert base64 encode
      String result = base64Encode(digest.bytes);
      return result;
  }

}
