import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nasa_apod/application/features/apod_screen/data/models/apod_model.dart';
import 'package:nasa_apod/application/features/apod_screen/domain/repositories/apod_repo.dart';

class ApodUseCases {
  final ApodRepo apodRepo;

  const ApodUseCases({required this.apodRepo});

  Future<ApodModel> getApod({required String date}) async =>
      await apodRepo.getApod(date: date);

  getRandomDate() {
    final startDate = DateTime(1995, 6, 16);
    final endDate = DateTime.now();
    final randomRange = DateTimeRange(start: startDate, end: endDate);

    return DateTime(
      startDate.year,
      startDate.month,
      startDate.day + Random().nextInt(randomRange.duration.inDays),
    );
  }
}
