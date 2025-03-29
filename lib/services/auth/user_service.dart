import 'package:quillhub/models/user.dart';
import 'package:quillhub/services/api/api_service.dart';
import 'package:quillhub/services/auth/token_service.dart';
import 'package:quillhub/utils/constants.dart';

// User
class UserService {
  static Future<User> userDetail() async {
    ApiService service = ApiService();
    TokenService tokenService = TokenService();
    final token = await tokenService.getToken();
    final response = await service.getRequest(Constants.userURL, {'Accept': 'application/json', 'Authorization': 'Bearer $token'});
    if (response.error != null) {
      return User.errorCounter(response);
    }
    return User.fromJson(response.data as Map<String, dynamic>);
  }
}
