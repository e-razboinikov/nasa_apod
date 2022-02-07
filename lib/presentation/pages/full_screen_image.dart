import 'package:flutter/material.dart';

import '../widgets/custom_image_loader.dart';

class FullScreenImage extends StatelessWidget {
  static const routeName = '/full-screen-image';

  final String imageUrl;

  const FullScreenImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        child: Hero(
            tag: 'apod image', child: CustomImageLoader(imageUrl: imageUrl)));
  }
}
