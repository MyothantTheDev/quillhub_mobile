import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const String _tokenKey = 'auth_token';
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> getToken({String? tokenKey}) async {
    final prefs = await _prefs;
    return prefs.getString(tokenKey ?? _tokenKey) ?? '';
  }

  Future<int> getUerId() async {
    final prefs = await _prefs;
    return prefs.getInt('userId') ?? 0;
  }

  Future<void> saveToken(String value, {String? tokenKey}) async {
    final prefs = await _prefs;
    await prefs.setString(tokenKey ?? _tokenKey, value);
  }

  Future<void> removeToken({String? tokenKey}) async {
    final prefs = await _prefs;
    await prefs.remove(tokenKey ?? _tokenKey);
  }

  Future<void> clearToken() async {
    final prefs = await _prefs;
    await prefs.clear();
  }
}