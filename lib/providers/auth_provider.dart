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
  AuthState build() {
    _getInitialAuthToken();
    return AuthState(status: AuthStatus.unauthenticated);
  }

  Future<void> _getInitialAuthToken() async {

    String token = await _tokenService.getToken();
    if (token.isEmpty) {
      state = AuthState(status: AuthStatus.unauthenticated);
      return;
    }

    final user = await _userService.userDetail();
    state = await _getAuthStateFromResponse(user);
  }

  Future<AuthState> _getAuthStateFromResponse(User user) async {

    if(user.error == null) {
      return AuthState(status: AuthStatus.authenticated, user: user);
    }

    return AuthState(status: AuthStatus.unauthenticated, errorMessage: user.error);
  }

  Future<void> login(String email, String password) async {

    state = AuthState(status: AuthStatus.loading);
    User user = await _authService.login(email, password);
    state = await _getAuthStateFromResponse(user);
  }

  Future<void> logout() async {

    state = AuthState(status: AuthStatus.loading);
    await _authService.logout();
    await _tokenService.removeToken();
    state = AuthState(status: AuthStatus.unauthenticated);
  }

  Future<void> register(String name, String email, String password) async {

    state = AuthState(status: AuthStatus.loading);
    User user = await _authService.register(name, email, password);
    state = await _getAuthStateFromResponse(user);
  }

}