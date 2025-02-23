import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const String _tokenKey = 'auth_token';
  late SharedPreferences _prefs;

  TokenService() {
    _initializePreferences();
  }

  Future<void> _initializePreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String> getToken({String? tokenKey}) async {
    return _prefs.getString(tokenKey ?? _tokenKey) ?? '';
  }

  Future<int> getUerId() async {
    return _prefs.getInt('userId') ?? 0;
  }

  Future<void> saveToken(String value, {String? tokenKey}) async {
    await _prefs.setString(tokenKey ?? _tokenKey, value);
  }

  Future<void> removeToken({String? tokenKey}) async {
    await _prefs.remove(tokenKey ?? _tokenKey);
  }

  Future<void> clearToken() async {
    await _prefs.clear();
  }
}