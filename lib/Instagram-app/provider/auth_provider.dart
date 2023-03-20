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
