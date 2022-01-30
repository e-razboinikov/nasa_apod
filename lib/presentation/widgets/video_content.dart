import 'package:flutter/material.dart';

import '../providers/apod_provider.dart';

class VideoContent extends StatelessWidget {
  const VideoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apodData = Provider.of<ApodProvider>(context);
    return Center(
      child: Text(apodData.url),
    );
  }
}
