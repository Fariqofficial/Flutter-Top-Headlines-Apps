import 'package:news_indo_app/features/guest/domain/entities/user.dart';

class UserRemoteMapper extends UserModel {
  const UserRemoteMapper({
    required super.uid,
    super.displayName,
    super.email,
    super.photoURL,
  });

  factory UserRemoteMapper.fromFirebaseUser(dynamic firebaseUser) {
    return UserRemoteMapper(
      uid: firebaseUser.uid,
      displayName: firebaseUser.displayName,
      email: firebaseUser.email,
      photoURL: firebaseUser.photoURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
    };
  }

  UserModel get toEntity => UserModel(
    uid: uid,
    email: email,
    displayName: displayName,
    photoURL: photoURL,
  );
}
