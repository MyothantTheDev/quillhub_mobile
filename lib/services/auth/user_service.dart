import 'package:quillhub/models/user.dart';
import 'package:quillhub/services/api/api_service.dart';
import 'package:quillhub/services/auth/token_service.dart';
import 'package:quillhub/utils/core/constants.dart';

// User
class UserService {

  final ApiService _service = ApiService();
  final TokenService _tokenService = TokenService();

  Future<User> userDetail() async {

    final token = await _tokenService.getToken();
    if (token.isEmpty) {
      return User(error: "Unauthorized: No token found");
    }
    final response = await _service.getRequest(Constants.userURL, headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'});
    if (response.error != null) {
      return User.errorCounter(response);
    }
    return User.fromJson(response.data as Map<String, dynamic>);
  }

}
