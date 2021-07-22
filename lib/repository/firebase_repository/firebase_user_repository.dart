import 'package:firebase_auth/firebase_auth.dart';
import 'package:forseason/model/login_user_model.dart';
import 'package:forseason/model/result.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../user_repository.dart';

class FirebaseUserRepository extends UserRepository {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void login() async {
    UserCredential? userCredential = await signInWithGoogle();

    if (userCredential == null) {
      return;
    }

    await _googleSignIn.signIn();
  }

  @override
  void logout() async {
    await _googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return null;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Stream<Result<LoginUser>> authStateChanges() {
    return FirebaseAuth.instance.authStateChanges().map((User? user) {
      if (user != null) {
        return Result.success(
          LoginUser(user.email, user.photoURL, user.displayName),
        );
      }
      return Result.error(Exception('로그인 실패'));
    });
  }
}