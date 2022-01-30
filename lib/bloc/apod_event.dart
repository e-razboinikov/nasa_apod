part of 'apod_bloc.dart';

abstract class ApodEvent {}

class LoadApodEvent extends ApodEvent {}

class LoadRandomApodEvent extends ApodEvent {}
