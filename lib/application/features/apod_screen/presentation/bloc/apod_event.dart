part of 'apod_bloc.dart';

@freezed
class ApodEvent with _$ApodEvent {
  const factory ApodEvent.loadApod({required DateTime date}) = LoadApodEvent;

  const factory ApodEvent.loadRandomApod() = LoadRandomApodEvent;
}
