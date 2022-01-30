import 'package:flutter/material.dart';

import '../presentation.screens/full_screen_image.dart';
import '../providers/apod_provider.dart';
import './custom_image_loader.dart';

class ImageContent extends StatelessWidget {
  const ImageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apodData = Provider.of<ApodProvider>(context);
    return Stack(
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed(FullScreenImage.routeName),
          child: CustomImageLoader(
            imageUrl: apodData.url,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.black45,
          width: double.infinity,
          child: Text(
            apodData.title,
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
