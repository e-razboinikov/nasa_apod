import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_apod/features/apod_screen/presentation/bloc/apod_bloc.dart';
import 'package:nasa_apod/features/apod_screen/presentation/pages/apod_page.dart';

class SplashScreenPage extends StatefulWidget {
  static const String name = '/';

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
      ..addStatusListener(_onNavigation);
  }

  void _onNavigation(AnimationStatus status) {
    context.read<ApodBloc>().add(
          LoadApodEvent(
            date: DateTime.now(),
          ),
        );
    if (status == AnimationStatus.completed) context.goNamed(ApodPage.name);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeStatusListener(_onNavigation)
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
