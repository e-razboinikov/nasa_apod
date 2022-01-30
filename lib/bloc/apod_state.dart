part of 'apod_bloc.dart';

abstract class ApodState {}

class InititalApodState extends ApodState {}

class LoadingApodState extends ApodState {}

class LoadedApodState extends ApodState {
  final Apod apod;

  LoadedApodState({required this.apod});
}

class FailureApodState extends ApodState {
  final String errorMessage;

  FailureApodState({required this.errorMessage});
}
