import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../api/apod_api.dart';

class ApodBody extends StatelessWidget {
  final DateTime selectedDate;
  const ApodBody({required this.selectedDate, key}) : super(key: key);

  Widget _buildImage(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchImage(selectedDate),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            height: 300.0,
            child: Image.network(
              snapshot.data!,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return Shimmer.fromColors(
            child: Container(
              height: 300.0,
              width: double.infinity,
              color: Colors.white,
            ),
            baseColor: Colors.grey,
            highlightColor: Colors.grey.withOpacity(0.5),
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
          return SizedBox(
            height: 20.0,
            width: double.infinity,
            child: Text(
              snapshot.data!,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.end,
            ),
          );
        } else {
          return Shimmer.fromColors(
            child: Container(
              height: 20.0,
              width: double.infinity,
              color: Colors.white,
            ),
            baseColor: Colors.grey,
            highlightColor: Colors.grey.withOpacity(0.5),
          );
        }
      },
    );
  }

  Widget _buildExplanation(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchExplanation(selectedDate),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
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
    return ListView(
      children: [
        SizedBox(
          height: 300.0,
          child: GridTile(
            child: _buildImage(context),
            footer:
                Container(color: Colors.black87, child: _buildTitle(context)),
          ),
        ),
        _buildExplanation(context),
      ],
    );
  }
}
