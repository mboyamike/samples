import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/project.dart';

class ProjectsRepository {
  ProjectsRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  static const projectsCollectionPath = 'projects';

  final FirebaseFirestore _firebaseFirestore;

  String get autoID => _firebaseFirestore.collection('projects').doc().id;

  Future<Project?> fetchProject({required String link}) async {
    final query = await _firebaseFirestore
        .collection(projectsCollectionPath)
        .where('link', isEqualTo: link)
        .limit(1)
        .get();

    if (query.docs.isEmpty) {
      return null;
    }

    final document = query.docs.first;

    final project = Project.fromMap(document.data());
    return project;
  }

  Future<Project> saveProject({required Project project}) async {
    await _firebaseFirestore
        .collection(projectsCollectionPath)
        .doc(project.id)
        .set(project.toMap());
    return project;
  }
}
