import 'package:flutter/material.dart';
import 'package:samples/form_validators/form_validators.dart';
import 'package:samples/widgets/form_image.dart';

import '../widgets/widgets.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({Key? key}) : super(key: key);

  static const path = '/';

  @override
  Widget build(BuildContext context) {
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

  void submit() {}

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
