part of 'apod_bloc.dart';

@freezed
class ApodState with _$ApodState {
  const factory ApodState.initial() = InitialApodState;

  const factory ApodState.loading({required DateTime date}) = LoadingApodState;

  const factory ApodState.loaded({required Apod apod}) = LoadedApodState;

  const factory ApodState.failure({required String errorMessage}) =
      FailureApodState;
}
