import 'package:flutter/material.dart';

class ApodLoadingScaffold extends StatelessWidget {
  const ApodLoadingScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: LinearProgressIndicator(),
      ),
    );
  }
}
