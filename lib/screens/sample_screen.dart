import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:samples/form_validators/form_validators.dart';
import 'package:samples/models/models.dart';
import 'package:samples/providers/auth_provider.dart';
import 'package:samples/repositories/projects_repository.dart';
import 'package:samples/screens/sign_in_screen.dart';
import 'package:samples/widgets/form_image.dart';

import '../widgets/widgets.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({Key? key}) : super(key: key);

  static const path = '/';

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    if (authProvider.user == null) {
      return const SignInScreen();
    }

    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: _Body(
              maxWidth: 800,
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key, this.maxWidth, this.padding}) : super(key: key);

  final double? maxWidth;
  final EdgeInsets? padding;

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final imageLink = 'assets/images/my_image.png';
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  bool isLoading = true;
  Project? project;

  Map<String, dynamic> getProjectContent() {
    return {
      'title': titleController.text,
      'body': bodyController.text,
      'imageLink': imageLink,
    };
  }

  void updateProjectVariable() {
    if (project == null) {
      final id = GetIt.I.get<ProjectsRepository>().autoID;
      final user = context.read<AuthProvider>().user;
      project = Project(
        id: id,
        link: SampleScreen.path,
        content: getProjectContent(),
        userDetails: user?.toMap() ?? {},
      );
    } else {
      project = project!.copyWith(content: getProjectContent());
    }
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return const AlertDialog(
          title: Text('Successfully uploaded!'),
          content: Text(
            'Successfully uploaded project!',
          ),
        );
      },
    );
  }

  void showErrorDialog(String error) {
    showDialog(
      context: context,
      builder: (_) {
        return const AlertDialog(
          title: Text('An error Occurred'),
          content: Text(
            'Looks like an error occurred. Please try again later',
          ),
        );
      },
    );
  }

  void submit() async {
    updateProjectVariable();

    try {
      setState(() {
        isLoading = true;
      });
      await GetIt.I<ProjectsRepository>().saveProject(project: project!);
      setState(() {
        isLoading = false;
      });
      showSuccessDialog();
    } catch (error) {
      log(error.toString());
      showErrorDialog(error.toString());
    }
  }

  void fetchProjectAndPopulateFields() async {
    final fetchedProject = await GetIt.I<ProjectsRepository>()
        .fetchProject(link: SampleScreen.path);
    if (fetchedProject != null) {
      project = fetchedProject;
      titleController.text = fetchedProject.content['title'] ?? '';
      bodyController.text = fetchedProject.content['body'] ?? '';
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchProjectAndPopulateFields();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    return Container(
      constraints: BoxConstraints(maxWidth: widget.maxWidth ?? double.infinity),
      padding: widget.padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormImage(url: 'assets/images/web-design.png', height: 300),
          FormTitle(title: 'Title', isRequired: true),
          Spacing.vertical(8),
          FormFieldWidget(
            controller: titleController,
            validator: FormValidators.requiredValidator,
          ),
          Spacing.vertical(16),
          FormTitle(title: 'Body'),
          Spacing.vertical(8),
          FormFieldWidget(controller: bodyController, maxLines: 6),
          Spacing.vertical(24),
          ElevatedButton(
            onPressed: submit,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
