import 'package:universal_html/html.dart' as html_cache;

class StorageCached {
  ///constant name key
  static const accessToken = 'atkc';
  static const refreshToken = 'rtkc';
  static const serverPublicKey = "spk";
  static const dataUserInfo = "dui";
  // key encrypt
  static const mKey = "my";
  static const mIV = "mv";



  /// Lưu dữ liệu vào local storage của trình duyệt
  static final LocalStorage localStorage = LocalStorage();
  /// Lưu dữ liệu vào session storage của trình duyệt
  static final SessionStorage sessionStorage = SessionStorage();
  /// Lưu dữ liệu vào cookie storage của trình duyệt
  static final CookieStorage cookieStorage = CookieStorage();
}

class LocalStorage {
  void saveString(String key, String value) {
    print(html_cache.window.document.cookie);
    html_cache.window.localStorage[key] = value;
  }

  void saveInteger(String key, int value) {
    html_cache.window.localStorage[key] = value.toString();
  }

  void saveBoolean(String key, bool value) {
    html_cache.window.localStorage[key] = value.toString();
  }

  String getString(String key) {
    return html_cache.window.localStorage[key] ?? '';
  }

  int getInt(String key) {
    return int.parse(html_cache.window.localStorage[key] ?? '0');
  }

  bool getBoolean(String key) {
    return html_cache.window.localStorage[key] == 'true';
  }

  void removeByKey(String key) {
    if (html_cache.window.localStorage.containsKey(key)) {
      html_cache.window.localStorage.remove(key);
    }
  }

  void removeAll() {
    html_cache.window.localStorage.clear();
  }
}

class SessionStorage {
  void saveString(String key, String value) {
    html_cache.window.sessionStorage[key] = value;
  }

  void saveInteger(String key, int value) {
    html_cache.window.sessionStorage[key] = value.toString();
  }

  void saveBoolean(String key, bool value) {
    html_cache.window.sessionStorage[key] = value.toString();
  }

  String getString(String key) {
    return html_cache.window.sessionStorage[key] ?? '';
  }

  int getInt(String key) {
    return int.parse(html_cache.window.sessionStorage[key] ?? '0');
  }

  bool getBoolean(String key) {
    return html_cache.window.sessionStorage[key] == 'true';
  }

  void removeByKey(String key) {
    if (html_cache.window.sessionStorage.containsKey(key)) {
      html_cache.window.sessionStorage.remove(key);
    }
  }

  void removeAll() {
    html_cache.window.sessionStorage.clear();
  }
}

class CookieStorage {
  void saveString(String key, int value, int secondExpired) {
    html_cache.window.document.cookie = "$key=$value;max-age=$secondExpired; ";
  }

  void saveInteger(String key, int value, int secondExpired) {
    html_cache.window.document.cookie = "$key=$value;max-age=$secondExpired; ";
  }

  void saveBoolean(String key, bool value, int secondExpired) {
    html_cache.window.document.cookie = "$key=$value;max-age=$secondExpired; ";
  }

  String getString(String key) {
    Map<dynamic, dynamic> cookieData = convertToMap();
    return cookieData.containsKey(key) ? cookieData[key] : '';
  }

  int getInt(String key) {
    Map<dynamic, dynamic> cookieData = convertToMap();
    return int.parse(cookieData.containsKey(key) ? cookieData[key] : '0');
  }

  bool getBoolean(String key) {
    Map<dynamic, dynamic> cookieData = convertToMap();
    return cookieData.containsKey(key) ? (cookieData[key] == "true") : false;
  }

  void removeByKey(String key) {
    Map<dynamic, dynamic> cookieData = convertToMap();
    if (cookieData.containsKey(key)) {
      cookieData.remove(key);
      html_cache.window.document.cookie = cookieData.toString();
    }
  }

  void removeAll() {
    html_cache.window.document.cookie = "";
  }

  Map convertToMap() {
    final cookie = html_cache.window.document.cookie!;
    final entity = cookie.split("; ").map((item) {
      final split = item.split("=");
      return MapEntry(split[0], split[1]);
    });
    return Map.fromEntries(entity);
  }
}