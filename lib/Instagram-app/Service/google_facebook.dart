import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAndFacebookAuthentication {
  final _auth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn.standard();
  final _facebookAuthentication = FacebookAuth.instance;

  Stream<User?> get userState => _auth.authStateChanges();

  Future<void> googleSignIn() async {
    final GoogleSignInAccount? googleAccount = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuthentication =
        await googleAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken);
    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseException {
      rethrow;
    }
  }

  Future<void> signInFacebook() async {
    final LoginResult loginResult = await _facebookAuthentication.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    try {
      await _auth.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> signOutAccount() async {
    try {
      await _auth.signOut();
      await _googleAuth.signOut();
      await _facebookAuthentication.logOut();
    } on FirebaseException {
      rethrow;
    }
  }
}
