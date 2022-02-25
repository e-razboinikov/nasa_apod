import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nasa_apod/application/features/apod_screen/data/models/apod.dart';
import 'package:nasa_apod/application/features/apod_screen/domain/repositories/apod_repo.dart';

class ApodUseCases {
  final ApodRepo apodRepo;

  const ApodUseCases({required this.apodRepo});

  Future<Apod> getApod({required String date}) async =>
      await apodRepo.getApod(date: date);

  Future<Apod> getRandomApod() async {
    final date = getRandomDate();
    return await apodRepo.getApod(date: date);
  }

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
