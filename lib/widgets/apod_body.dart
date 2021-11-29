import 'package:flutter/material.dart';

import '../api/apod_api.dart';

class ApodBody extends StatelessWidget {
  final DateTime selectedDate;
  const ApodBody({required this.selectedDate, key}) : super(key: key);

  Widget _buildImage(BuildContext context, double displayHeight) {
    return FutureBuilder<String>(
      future: fetchImage(selectedDate),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            height: displayHeight * 0.5,
            width: double.infinity,
            child: Image.network(
              snapshot.data!,
              fit: BoxFit.fill,
            ),
          );
        } else {
          return SizedBox(
            height: displayHeight * 0.5,
            width: double.infinity,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget _buildTitle(BuildContext context) {
    return FutureBuilder<String>(
        future: fetchTitle(selectedDate),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.black45,
              width: double.infinity,
              child: Text(
                snapshot.data!,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.end,
              ),
            );
          } else {
            return const LinearProgressIndicator();
          }
        });
  }

  Widget _buildExplanation(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchExplanation(selectedDate),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(snapshot.data!),
          );
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _displayHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: _displayHeight,
      child: Column(
        children: [
          SizedBox(
            height: _displayHeight * 0.5,
            child: Stack(
              children: [
                _buildImage(context, _displayHeight),
                Align(
                  child: _buildTitle(context),
                  alignment: Alignment.bottomRight,
                ),
              ],
            ),
          ),
          SizedBox(
            height: _displayHeight * 0.4,
            child: SingleChildScrollView(
              child: _buildExplanation(context),
            ),
          ),
        ],
      ),
    );
  }
}
