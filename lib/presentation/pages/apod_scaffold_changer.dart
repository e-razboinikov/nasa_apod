import 'package:flutter/material.dart';

import '../providers/apod_provider.dart';
import 'apod_content_scaffold.dart';
import 'apod_loading_scaffold.dart';

class ApodScreen extends StatefulWidget {
  const ApodScreen({Key? key}) : super(key: key);

  @override
  State<ApodScreen> createState() => _ApodScreenState();
}

class _ApodScreenState extends State<ApodScreen> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<ApodProvider>(context).isLoading
        ? const ApodLoadingScaffold()
        : const ApodScaffold();
  }
}
