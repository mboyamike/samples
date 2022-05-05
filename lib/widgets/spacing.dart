import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  const Spacing({Key? key, this.vertical, this.horizontal}) : super(key: key);

  const Spacing.vertical(double height, {Key? key})
      : vertical = height,
        horizontal = null,
        super(key: key);

  const Spacing.horizontal(double width, {Key? key})
      : horizontal = width,
        vertical = null,
        super(key: key);

  final double? vertical;
  final double? horizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vertical,
      width: horizontal,
    );
  }
}
