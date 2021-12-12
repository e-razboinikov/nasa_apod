import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/apod_provider.dart';
import '../widgets/custom_image_loader.dart';

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
            child: CustomImageLoader(
          imageUrl: Provider.of<ApodProvider>(context, listen: false).hdurl,
        )),
      ),
    );
  }
}

// Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(
//                 Provider.of<ApodProvider>(context, listen: false).hdurl,
//               ),
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//       ),
