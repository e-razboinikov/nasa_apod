import 'package:dio/dio.dart';
import 'package:nasa_apod/application/features/apod_screen/data/data_sources/api/apod_api.dart';
import 'package:nasa_apod/application/features/apod_screen/data/models/apod.dart';
import 'package:nasa_apod/application/features/apod_screen/domain/repositories/apod_repo.dart';

class ApodRepoImpl extends ApodRepo {
  Future<Apod> getApod({required String date}) async =>
      await ApodApi(Dio()).getApod(date: date);
}
