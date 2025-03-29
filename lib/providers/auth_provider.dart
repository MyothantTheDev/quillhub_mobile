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

  @override
  AuthState build() {
    _initializeAuth();
    return AuthState(status: AuthStatus.unauthenticated);
  }

  AuthState _getAuthStateFromResponse(User user, {bool errorMessage = false}) {
    if (user.error == null) {
      return AuthState(status: AuthStatus.authenticated, user: user);
    } else {
      if (errorMessage) {
        return AuthState(status: AuthStatus.error, errorMessage: user.error);
      } else {
        return AuthState(status: AuthStatus.unauthenticated);
      }
    }
  }

  Future<void> _initializeAuth() async {
    String token = await _tokenService.getToken();
    if(token == '') {
      state = AuthState(status: AuthStatus.unauthenticated);
      return;
    }
    final user = await UserService.userDetail();
    state = _getAuthStateFromResponse(user);
  }

  Future<void> login(String email, String password) async {
    state = AuthState(status: AuthStatus.loading);
    final user = await _authService.login(email, password);
    state = _getAuthStateFromResponse(user, errorMessage: true);
  }

  Future<void> register(String name, String email, String password) async {
    final user = await _authService.register(name, email, password);
    state = _getAuthStateFromResponse(user, errorMessage: true);
  }

  void logout() async {
    state = AuthState(status: AuthStatus.unauthenticated);
    _tokenService.removeToken();
  }
}
