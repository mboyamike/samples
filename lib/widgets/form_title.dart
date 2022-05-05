import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({
    Key? key,
    required this.title,
    this.style,
    this.isRequired = false,
  }) : super(key: key);

  final String title;
  final TextStyle? style;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final titleStyle = style ?? Theme.of(context).textTheme.headline6;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title, style: titleStyle),
        if (isRequired)
          const Text(
            '*',
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }
}
