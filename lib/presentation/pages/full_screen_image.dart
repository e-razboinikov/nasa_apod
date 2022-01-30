import 'package:flutter/material.dart';

import '../widgets/custom_image_loader.dart';

class FullScreenImage extends StatelessWidget {
  static const routeName = '/full-screen-image';

  final String imageUrl;

  const FullScreenImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(DateTime.now()),
      direction: DismissDirection.vertical,
      onDismissed: (_) => Navigator.of(context).pop(),
      child: InteractiveViewer(child: CustomImageLoader(imageUrl: imageUrl)),
    );
  }
}
