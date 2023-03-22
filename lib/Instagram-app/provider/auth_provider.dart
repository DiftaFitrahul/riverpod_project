import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/Instagram-app/Service/google_facebook.dart';

final authProvider = Provider((ref) => GoogleAndFacebookAuthentication());

final userState = StreamProvider((ref) => ref.watch(authProvider).userState);

class AuthGoogle extends StateNotifier<bool> {
  AuthGoogle(this.ref) : super(false);
  final Ref ref;
  Future<void> signInGoogle() async {
    try {
      state = true;
      await ref.read(authProvider).googleSignIn();
      state = false;
    } catch (e) {
      state = false;
      rethrow;
    }
  }
}

final googleSignInProvider =
    StateNotifierProvider<AuthGoogle, bool>((ref) => AuthGoogle(ref));

class AuthFacebook extends StateNotifier<bool> {
  AuthFacebook(this.ref) : super(false);
  final Ref ref;

  Future<void> signinFacebook() async {
    try {
      state = true;
      await ref.read(authProvider).signInFacebook();
      state = false;
    } catch (e) {
      state = false;
      rethrow;
    }
  }
}

final facebookSignInProvider =
    StateNotifierProvider<AuthFacebook, bool>((ref) => AuthFacebook(ref));
