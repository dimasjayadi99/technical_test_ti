import 'package:shared_preferences/shared_preferences.dart';

import '../consts/string.dart';

class SharedPrefsHelper {
  static SharedPrefsHelper? _instance;
  static SharedPreferences? _prefs;

  SharedPrefsHelper._();

  static Future<SharedPrefsHelper> init() async {
    _prefs = await SharedPreferences.getInstance();
    _instance = SharedPrefsHelper._();
    return _instance!;
  }

  Future<void> setToken(String token) async {
    await _prefs?.setString(
      StringConst.tokenKey,
      token,
    );
  }

  String getToken() {
    return _prefs?.getString(StringConst.tokenKey) ?? '';
  }
}
