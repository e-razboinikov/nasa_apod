import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nasa_apod/features/apod_screen/presentation/widgets/custom_image_loader.dart';

class FullScreenImage extends StatelessWidget {
  static const name = 'fullscreen-image';

  final String imageUrl;

  const FullScreenImage({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InteractiveViewer(
        child: Hero(
          tag: 'apod',
          child: CustomImageLoader(imageUrl: imageUrl),
        ),
      );
}
