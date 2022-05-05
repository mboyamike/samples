import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/project.dart';

class ProjectsRepository {
  ProjectsRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  static const projectsCollectionPath = 'projects';

  final FirebaseFirestore _firebaseFirestore;

  Future<Project?> fetchProject({required String link}) async {
    final document = await _firebaseFirestore
        .collection(projectsCollectionPath)
        .doc(link)
        .get();

    if (document.exists && document.data() != null) {
      final project = Project.fromMap(document.data()!);
      return project;
    } else {
      return null;
    }
  }

  Future<Project> saveProject({required Project project}) async {
    await _firebaseFirestore
        .collection(projectsCollectionPath)
        .doc(project.link)
        .set(project.toMap());
    return project;
  }
}
