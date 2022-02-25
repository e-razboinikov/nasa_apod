import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:nasa_apod/application/features/apod_screen/data/models/apod_model.dart';
import 'package:nasa_apod/application/features/apod_screen/domain/use_cases/apod_use_cases.dart';

part 'apod_bloc.freezed.dart';

part 'apod_event.dart';

part 'apod_state.dart';

class ApodBloc extends Bloc<ApodEvent, ApodState> {
  final ApodUseCases apodUseCases;
  late Emitter emitItem;

  ApodBloc({required this.apodUseCases}) : super(const InitialApodState()) {
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
      final ApodModel apod = await apodUseCases.getApod(
          date: DateFormat('yyyy-MM-dd').format(event.date));
      emitItem(LoadedApodState(apod: apod));
    } catch (e) {
      emitItem(FailureApodState(errorMessage: e.toString()));
    }
  }

  _loadRandomApod(LoadRandomApodEvent event) async {
    final DateTime radnomDate = apodUseCases.getRandomDate();
    emitItem(LoadingApodState(date: radnomDate));
    try {
      final ApodModel apod = await apodUseCases.getApod(
          date: DateFormat('yyyy-MM-dd').format(radnomDate));
      emitItem(LoadedApodState(apod: apod));
    } catch (e) {
      emitItem(FailureApodState(errorMessage: e.toString()));
    }
  }
}
