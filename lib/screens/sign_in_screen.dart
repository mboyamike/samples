import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples/providers/auth_provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          context.read<AuthProvider>().signInWithGoogle();
        },
        child: const Text('Sign in with Google'),
      ),
    );
  }
}
