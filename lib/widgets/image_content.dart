import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/full_screen_image_screen.dart';
import '../providers/apod_provider.dart';

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
          child: Image.network(
            apodData.apod.url,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return LinearProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.black45,
          width: double.infinity,
          child: Text(
            apodData.apod.title,
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
