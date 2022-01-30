import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nasa_apod/data/repositories/apod_repository.dart';

import '../data/models/apod.dart';

part 'apod_event.dart';

part 'apod_state.dart';

class ApodBloc extends Bloc<ApodEvent, ApodState> {
  final ApodRepository repository;
  DateTime date = DateTime.now();

  ApodBloc({required this.repository}) : super(InititalApodState()) {
    on<LoadApodEvent>((event, emit) async {
      date = event.date;
      emit(LoadingApodState());
      try {
        final Apod apod = await repository.getApod(
            dateForApi: DateFormat('yyyy-MM-dd').format(event.date));
        emit(LoadedApodState(apod: apod));
      } catch (e) {
        emit(FailureApodState(errorMessage: e.toString()));
      }
    });

    on<LoadRandomApodEvent>((event, emit) async {
      date = getRandomDate();
      emit(LoadingApodState());
      try {
        final Apod apod = await repository.getApod(
            dateForApi: DateFormat('yyyy-MM-dd').format(date));
        emit(LoadedApodState(apod: apod));
      } catch (e) {
        emit(FailureApodState(errorMessage: e.toString()));
      }
    });
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
