import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAndFacebookAuthentication {
  final _auth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn.standard();

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

  Future<void> signOut() async {
    try {
      _googleAuth.signOut();
    } on FirebaseException {
      rethrow;
    }
  }
}
