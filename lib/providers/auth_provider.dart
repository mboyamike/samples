import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:samples/repositories/users_repository.dart';

import 'base_provider.dart';

class AuthProvider extends BaseProvider {
  AuthProvider() {
    onUserChangedListener = usersRepository.authStateChanges.listen((event) {
      user = event;
      notifyListeners();
    });
  }

  final UsersRepository usersRepository = GetIt.I.get<UsersRepository>();
  late final StreamSubscription<User?> onUserChangedListener;

  User? user;

  Future<void> signInWithGoogle() {
    return usersRepository.signInWithGoogle();
  }

  @override
  void dispose() {
    onUserChangedListener.cancel();
    super.dispose();
  }
}
