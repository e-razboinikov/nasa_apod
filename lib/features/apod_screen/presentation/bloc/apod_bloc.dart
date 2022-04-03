import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nasa_apod/features/apod_screen/domain/entities/apod_entity.dart';
import 'package:nasa_apod/features/apod_screen/domain/use_cases/apod_use_cases.dart';

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

  Future<void> _loadApod(LoadApodEvent event) async {
    emitItem(const LoadingApodState());
    try {
      final apod = await apodUseCases.getApod(date: event.date);
      emitItem(LoadedApodState(apod: apod));
    } catch (e) {
      emitItem(FailureApodState(errorMessage: e.toString()));
    }
  }

  Future<void> _loadRandomApod(LoadRandomApodEvent event) async {
    emitItem(const LoadingApodState());
    try {
      final apod = await apodUseCases.getRandomApod();
      emitItem(LoadedApodState(apod: apod));
    } catch (e) {
      emitItem(FailureApodState(errorMessage: e.toString()));
    }
  }
}
