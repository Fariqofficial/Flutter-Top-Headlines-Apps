import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_indo_app/features/guest/data/mapper/user_remote_mapper.dart';
import 'package:news_indo_app/features/guest/domain/entities/user.dart';

abstract class UserRemoteDatasource {
  Future<UserModel> signInWithGoogle();
  Future<void> signOut();
  Future<UserModel?> getCurrentUser();
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  const UserRemoteDatasourceImpl(this._auth, this._googleSignIn);

  @override
  Future<UserModel?> getCurrentUser() async {
    final User? firebaseUser = _auth.currentUser;
    if (firebaseUser == null) throw Exception('Get current user failed');
    return UserRemoteMapper.fromFirebaseUser(firebaseUser).toEntity;
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) throw Exception('Google Sign-In cancelled');

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser == null) throw Exception('Firebase Auth failed');

      return UserRemoteMapper.fromFirebaseUser(firebaseUser).toEntity;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
