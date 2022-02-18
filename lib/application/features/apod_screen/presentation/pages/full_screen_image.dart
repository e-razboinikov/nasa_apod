import 'package:flutter/material.dart';
import 'package:nasa_apod/application/features/apod_screen/presentation/widgets/custom_image_loader.dart';

class FullScreenImage extends StatelessWidget {
  static const routeName = '/full-screen-image';

  final String imageUrl;

  const FullScreenImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        child: Hero(tag: 'apod', child: CustomImageLoader(imageUrl: imageUrl)));
  }
}
