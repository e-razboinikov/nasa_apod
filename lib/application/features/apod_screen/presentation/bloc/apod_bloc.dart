import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:nasa_apod/application/features/apod_screen/data/models/apod.dart';
import 'package:nasa_apod/application/features/apod_screen/data/repositories/apod_repo_impl.dart';

part 'apod_bloc.freezed.dart';

part 'apod_event.dart';

part 'apod_state.dart';

class ApodBloc extends Bloc<ApodEvent, ApodState> {
  final ApodRepoImpl repository;
  late Emitter emitItem;

  ApodBloc({required this.repository}) : super(const InitialApodState()) {
    on<ApodEvent>((event, emit) async {
      emitItem = emit;
      await event.map(
        loadApod: _loadApod,
        loadRandomApod: _loadRandomApod,
      );
    });
  }

  _loadApod(LoadApodEvent event) async {
    emitItem(LoadingApodState(date: event.date));
    try {
      final Apod apod = await repository.getApod(
          dateForApi: DateFormat('yyyy-MM-dd').format(event.date));
      emitItem(LoadedApodState(apod: apod));
    } catch (e) {
      emitItem(FailureApodState(errorMessage: e.toString()));
    }
  }

  _loadRandomApod(LoadRandomApodEvent event) async {
    final DateTime radnomDate = getRandomDate();
    emitItem(LoadingApodState(date: radnomDate));
    try {
      final Apod apod = await repository.getApod(
          dateForApi: DateFormat('yyyy-MM-dd').format(radnomDate));
      emitItem(LoadedApodState(apod: apod));
    } catch (e) {
      emitItem(FailureApodState(errorMessage: e.toString()));
    }
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
