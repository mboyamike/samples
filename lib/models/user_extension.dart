import 'package:firebase_auth/firebase_auth.dart';

extension MapExtension on User {
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
    };
  }
}
