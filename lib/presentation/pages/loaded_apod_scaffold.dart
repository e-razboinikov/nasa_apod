import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import './full_screen_image.dart';
import '../../data/models/apod.dart';
import '../widgets/custom_image_loader.dart';

class LoadedApodScaffold extends StatelessWidget {
  final Apod apodData;
  final DateTime date;

  const LoadedApodScaffold(
      {required this.apodData, required this.date, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      color: Colors.black,
      collapsed: Container(
        color: Colors.black,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.arrow_upward_outlined,
                color: Colors.white,
              ),
              Text('Explanation'),
            ],
          ),
        ),
      ),
      panel: SingleChildScrollView(
        child: Text(apodData.explanation),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => MaterialPageRoute(
                builder: (ctx) => FullScreenImage(imageUrl: apodData.imageUrl)),
            child: CustomImageLoader(
              imageUrl: apodData.imageUrl,
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
      ),
    );
  }
}
