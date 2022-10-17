import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:convert/convert.dart';
import 'package:moffice_web/helpers/file/file_utils.dart';
import 'package:pointycastle/export.dart';
import 'package:path/path.dart';
import 'package:moffice_web/constants/constants.exports.dart';

class EncryptHelper {
  static final EncryptHelper _instance = EncryptHelper._internal();

  factory EncryptHelper() {
    return _instance;
  }

  EncryptHelper._internal();
  int keyLengthForEncrypter = 16; //Độ dài encrypter của moffice hiện tại là 16.

  Key createKeyFromHexString(String aesKeyHexString) {
    assert(aesKeyHexString.isNotEmpty,
        'aesKeyHexString không được null hoặc rỗng');
    Uint8List aesKeyBytesArrayForEncrypter = Uint8List(keyLengthForEncrypter);
    List<int> aesKeyByteArray = utf8.encode(aesKeyHexString);
    int aesKeyByteArrayLength = keyLengthForEncrypter;
    if (aesKeyByteArray.length < keyLengthForEncrypter) {
      aesKeyByteArrayLength = aesKeyByteArray.length;
    }
    for (int i = 0; i < aesKeyByteArrayLength; i++) {
      aesKeyBytesArrayForEncrypter[i] = aesKeyByteArray[i];
    }
    return Key(aesKeyBytesArrayForEncrypter);
  }

  IV createIVFromHexString(String ivKeyHexString) {
    assert(
        ivKeyHexString.isNotEmpty, 'ivKeyHexString không được null hoặc rỗng');
    Uint8List ivBytesArrayForEncrypter = Uint8List(keyLengthForEncrypter);
    List<int> ivByteArray = utf8.encode(ivKeyHexString);
    int ivByteArrayLength = keyLengthForEncrypter;
    if (ivByteArray.length < keyLengthForEncrypter) {
      ivByteArrayLength = ivByteArray.length;
    }

    for (int i = 0; i < ivByteArrayLength; i++) {
      ivBytesArrayForEncrypter[i] = ivByteArray[i];
    }
    return IV(ivBytesArrayForEncrypter);
  }

  ///Mã hoá AES/CBC/PKCS7PADDING with 256-bit key
  ///Input: Chuỗi cần mã hoá
  ///aesKeyHexString: key aes dạng hex string
  ///ivKeyHexString: iv dạng hex string
  ///Trả về: nếu 1 trong 3 đầu vào null hoặc rỗng thì trả về null, còn không trả về hex string
  String AESEncryptFromString(
      String input, String aesKeyHexString, String ivKeyHexString) {
    assert(input.isNotEmpty, 'Input không được null hoặc rỗng');
    assert(aesKeyHexString.isNotEmpty,
        'aesKeyHexString không được null hoặc rỗng');
    assert(
        ivKeyHexString.isNotEmpty, 'ivKeyHexString không được null hoặc rỗng');

    final key = createKeyFromHexString(aesKeyHexString);
    final iv = createIVFromHexString(ivKeyHexString);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
    final encrypted = encrypter.encrypt(input, iv: iv);

    return encrypted.base16;
  }

  String aesEncryptFromByteArray(
      List<int> input, String aesKeyHexString, String ivKeyHexString) {
    assert(input.isNotEmpty, 'Input không được null hoặc rỗng');
    assert(aesKeyHexString.isNotEmpty,
        'aesKeyHexString không được null hoặc rỗng');
    assert(
        ivKeyHexString.isNotEmpty, 'ivKeyHexString không được null hoặc rỗng');

    final key = createKeyFromHexString(aesKeyHexString);
    final iv = createIVFromHexString(ivKeyHexString);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
    final encrypted = encrypter.encryptBytes(input, iv: iv);
    return encrypted.base16;
  }

  String aesDecryptFromHexString(
      String hexStringInput, String aesKeyHexString, String ivKeyHexString) {
    assert(hexStringInput.isNotEmpty, 'Input không được null hoặc rỗng');
    assert(aesKeyHexString.isNotEmpty,
        'aesKeyHexString không được null hoặc rỗng');
    assert(
        ivKeyHexString.isNotEmpty, 'ivKeyHexString không được null hoặc rỗng');

    final key = createKeyFromHexString(aesKeyHexString);
    final iv = createIVFromHexString(ivKeyHexString);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
    final decryted = encrypter.decrypt16(hexStringInput, iv: iv);
    return decryted;
  }

  Future<File> aesDecryptFromByteArray (File file, String aesKeyHexString, String ivKeyHexString) async {
    // decode to byte array
    Uint8List fileByteArray = file.readAsBytesSync();
    // decrypt
    assert(fileByteArray.isNotEmpty, 'Input không được null hoặc rỗng');
    assert(aesKeyHexString.isNotEmpty,
    'aesKeyHexString không được null hoặc rỗng');
    assert(
    ivKeyHexString.isNotEmpty, 'ivKeyHexString không được null hoặc rỗng');
    final key = createKeyFromHexString(aesKeyHexString);
    final iv = createIVFromHexString(ivKeyHexString);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
    final decryted = encrypter.decryptBytes(Encrypted(fileByteArray), iv: iv);
    // create file decrypt in new folder

    String newPath = await FileUtils.makeDirectory(IdentifierConst.decryptFileFolder);
    File fileDecrypt =  await FileUtils.storeFileByByte(newPath, basename(file.path), decryted);
    // gán file và remove
    File fileDecryptCopy = fileDecrypt;
    return fileDecryptCopy;
  }

  /// Encrypt kiểu RSA. Nhận đầu vào là String và publicKey trả ra chuỗi mã hoá  dạng base 64RSA
  String rsaEncrypt(String stringInput, String publicKeyInput) {
    try {
      assert(stringInput.isNotEmpty, 'Input không được null hoặc rỗng');
      assert(
      publicKeyInput.isNotEmpty, 'publicKeyInput không được null hoặc rỗng');

      final publicKey = parseKeyFromString<RSAPublicKey>(splitStr(publicKeyInput));
      final encrypter = Encrypter(RSA(publicKey: publicKey));
      final encrypted = encrypter.encrypt(stringInput);
      return encrypted.base64;
    } catch (e){
      e.toString();
      return "";
    }
  }

  T parseKeyFromString<T extends RSAAsymmetricKey>(String pemString) {
    final parser = RSAKeyParser();
    return parser.parse(pemString) as T;
  }

  String splitStr(String str) {
    var begin = '-----BEGIN PUBLIC KEY-----\n';
    var end = '\n-----END PUBLIC KEY-----';
    int splitCount = str.length ~/ 64;
    List<String> strList = [];

    for (int i=0; i<splitCount; i++) {
      strList.add(str.substring(64*i, 64*(i+1)));
    }
    if (str.length%64 != 0) {
      strList.add(str.substring(64*splitCount));
    }

    return begin + strList.join('\n') + end;
  }

  String encryptRSA(String serverPublicKey, String aesKey) {
    // convert to publicKey
    final publicKey = CryptoUtils.rsaPublicKeyFromDERBytes(Uint8List.fromList(hex.decode(serverPublicKey))) ;
    /// Initalizing Cipher
    var cipher = PKCS1Encoding(RSAEngine());
    cipher.init(true, PublicKeyParameter<RSAPublicKey>(publicKey));
    /// Converting into a [Unit8List] from List<int>
    /// Then Encoding into Base64
    Uint8List output =
    cipher.process(Uint8List.fromList(utf8.encode(aesKey)));
    var dataEncrypt = hex.encode(output);
    return dataEncrypt.toUpperCase();
  }

}
