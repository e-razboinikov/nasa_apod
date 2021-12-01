import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/apod_provider.dart';
import '../widgets/apod_scaffold.dart';
import '../widgets/apod_loading_scaffold.dart';

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
