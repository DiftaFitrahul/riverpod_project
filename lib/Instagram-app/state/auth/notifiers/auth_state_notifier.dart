import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_project/Instagram-app/state/post/typedefs/user_id.dart';

import '../backend/authenticatior.dart';
import '../models/auth_result.dart';
import '../../user_info/backend/user_info_storage.dart';
import '../models/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();
  final _userInfo = const UserInfoStorage();
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
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
      state = AuthState(result: result, isLoading: false, userId: userId);
    } else {
      state = state.copiedWithIsLoading(false);
    }
  }

  Future<void> loginWithFacebook() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithFacebook();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
      state = AuthState(result: result, isLoading: false, userId: userId);
    } else {
      state = state.copiedWithIsLoading(false);
    }
  }

  Future<void> saveUserInfo({required UserId userId}) => _userInfo.saveUserInfo(
      userId: userId,
      displayName: _authenticator.displayName ?? '',
      email: _authenticator.email);
}
