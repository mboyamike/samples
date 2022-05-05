import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:samples/firebase_options.dart';
import 'package:samples/repositories/projects_repository.dart';
import 'package:samples/screens/sample_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  registerLocator();
  runApp(const App());
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: SampleScreen.path,
      builder: (_, __) => const SampleScreen(),
    ),
  ],
);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}

void registerLocator() {
  GetIt.instance.registerSingleton<ProjectsRepository>(
    ProjectsRepository(firebaseFirestore: FirebaseFirestore.instance),
  );
}
