import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_project/Instagram-app/state/auth/backend/authenticatior.dart';
import 'package:riverpod_project/Instagram-app/state/auth/models/auth_result.dart';

import '../models/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();
  AuthStateNotifier() : super(const AuthState.unknown()) {
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
          result: AuthResult.success,
          isLoading: false,
          userId: _authenticator.userId);
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logOut();
    state = const AuthState.unknown();
  }

  Future<void> logInWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithGoole();
    final userId = _authenticator.userId;
    if(result == AuthResult.success && userId != null) {
      state = AuthState(
          result: result,
          isLoading: false,
          userId: userId);
    } else {
      state = state.copiedWithIsLoading(false);
    }
  }
}
