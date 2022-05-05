import 'package:flutter/material.dart';

class FormImage extends StatelessWidget {
  const FormImage({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final isAssetImage = url.toLowerCase().startsWith('assets');

    if (isAssetImage) {
      return Image.asset(url, width: width, height: height, fit: fit);
    }

    return Image.network(url, width: width, height: height, fit: fit);
  }
}
