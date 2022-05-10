import 'package:firebase_auth/firebase_auth.dart';

class UsersRepository {
  UsersRepository(FirebaseAuth firebaseAuth) : _firebaseAuth = firebaseAuth {
    authStateChanges = _firebaseAuth.authStateChanges();
  }

  final FirebaseAuth _firebaseAuth;

  late final Stream<User?> authStateChanges;

  Future<void> signOut() => _firebaseAuth.signOut();

  Future<void> signInWithGoogle() async {
    await _firebaseAuth.signInWithPopup(GoogleAuthProvider());
  }
}
