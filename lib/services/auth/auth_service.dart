import 'package:quillhub/models/user.dart';
import 'package:quillhub/services/api/api_service.dart';
import 'package:quillhub/models/api_response.dart';
import 'package:quillhub/utils/constants.dart';

class AuthService {

  late ApiService _apiService;

  // Constructor
  AuthService() {
     _apiService = ApiService();
  }
  // Login
  Future<User> login(String email, String password) async {
    final apiResponse = await _apiService.postRequest(
        Constants.loginURL,
        {'Accept': 'application/json'},
        {'email': email, 'password': password}
    );
    return _handleUserModel(apiResponse);
  }

  // Register
  Future<User> register(String name, String email, String password) async {
    final apiResponse = await _apiService.postRequest(
        Constants.registerURL,
        {'Accept': 'application/json'},
        {
          'name': name,
          'email': email,
          'password': password,
          'password_confirm': password
        }
    );
    return _handleUserModel(apiResponse);
  }

  // Handling User Model
  User _handleUserModel(ApiResponse apiResponse) {
    if(apiResponse.error != null) {
      return User.errorCounter(apiResponse);
    }
    return User.fromJson(apiResponse as Map<String, dynamic>);
  }
}