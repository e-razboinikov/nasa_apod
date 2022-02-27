import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nasa_apod/features/apod_screen/domain/entities/apod_entity.dart';
import 'package:nasa_apod/features/apod_screen/domain/repositories/apod_repo.dart';

class ApodUseCases {
  final ApodRepo apodRepo;

  const ApodUseCases({required this.apodRepo});

  Future<ApodEntity> getApod({required DateTime date}) async {
    final dateFormatted = _formatDate(date);
    final apod = await apodRepo.getApod(date: dateFormatted);
    return apod;
  }

  Future<ApodEntity> getRandomApod() async {
    final randomDate = _getRandomDate();
    final randomDateFormatted = _formatDate(randomDate);
    final apod = await apodRepo.getApod(date: randomDateFormatted);
    return apod;
  }

  String _formatDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

  DateTime _getRandomDate() {
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
