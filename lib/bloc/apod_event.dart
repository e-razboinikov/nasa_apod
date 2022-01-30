part of 'apod_bloc.dart';

abstract class ApodEvent {}

class LoadApodEvent extends ApodEvent {
  final DateTime date;

  LoadApodEvent({required this.date});
}

class LoadRandomApodEvent extends ApodEvent {}
