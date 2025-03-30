import 'package:quillhub/models/auth_state.dart';
import 'package:quillhub/services/auth/token_service.dart';
import 'package:quillhub/services/auth/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:quillhub/services/auth/auth_service.dart';
import 'package:quillhub/models/user.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {

  final _authService = AuthService();
  final _tokenService = TokenService();
  final _userService = UserService();

  @override
  FutureOr<AuthState> build() async {
    return await _getInitialAuthToken();
  }

  Future<AuthState> _getInitialAuthToken() async {
    String token = await _tokenService.getToken();
    if (token.isEmpty) {
      return AuthState(status: AuthStatus.unauthenticated);
    }

    final user = await _userService.userDetail();
    return _getAuthStateFromResponse(user);
  }

  Future<AuthState> _getAuthStateFromResponse(User user) async {
    if(user.error == null) {
      return AuthState(status: AuthStatus.authenticated, user: user);
    }

    return AuthState(status: AuthStatus.unauthenticated, errorMessage: user.error);
  }

  Future<void> login(String email, String password) async {
    state = AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      User user = await _authService.login(email, password);
      return _getAuthStateFromResponse(user);
    });
  }

  Future<void> logout() async {
    state = await AsyncValue.guard(() async => AuthState(status: AuthStatus.loading));
    state = await AsyncValue.guard(() async {
      await _authService.logout();
      await _tokenService.removeToken();
      return AuthState(status: AuthStatus.unauthenticated);
    });
  }

  Future<void> register(String name, String email, String password) async {
    state = await AsyncValue.guard(() async => AuthState(status: AuthStatus.loading));
    state = await AsyncValue.guard(() async {
      User user = await _authService.register(name, email, password);
      return _getAuthStateFromResponse(user);
    });
  }

}