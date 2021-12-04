import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/apod_provider.dart';

class FullScreenImage extends StatelessWidget {
  static const routeName = '/full-screen-image';

  const FullScreenImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(DateTime.now()),
      direction: DismissDirection.vertical,
      onDismissed: (_) => Navigator.of(context).pop(),
      child: InteractiveViewer(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  Provider.of<ApodProvider>(context, listen: false).apod.hdurl,
                ),
                fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
