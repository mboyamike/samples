import 'package:flutter/material.dart';
import 'package:samples/form_validators/form_validators.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    Key? key,
    required this.controller,
    this.maxLines,
    this.hintText,
    this.validator,
    this.fillColor,
  }) : super(key: key);

  final TextEditingController controller;
  final int? maxLines;
  final String? hintText;
  final FormValidator? validator;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? Colors.grey.shade100,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
