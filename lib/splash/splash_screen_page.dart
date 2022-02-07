import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_apod/presentation/pages/apod_page.dart';

import '../bloc/apod_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  final String animationAsset = 'assets/json/nasa_animated_logo.json';

  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..addStatusListener(_onEndNavigation);
  }

  void _onEndNavigation(AnimationStatus status) {
    context.read<ApodBloc>().add(LoadApodEvent(date: DateTime.now()));
    if (status == AnimationStatus.completed) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const ApodPage()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeStatusListener(_onEndNavigation)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Lottie.asset(
            widget.animationAsset,
            controller: _controller,
            fit: BoxFit.fill,
            onLoaded: (composition) {
              _controller
                ..duration = const Duration(milliseconds: 3000)
                ..forward();
            },
          ),
        ),
      ),
    );
  }
}
