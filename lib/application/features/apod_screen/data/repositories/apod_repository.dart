import 'package:dio/dio.dart';
import 'package:nasa_apod/application/features/apod_screen/data/data_sources/api/api.dart';
import 'package:nasa_apod/application/features/apod_screen/data/models/apod.dart';

class ApodRepository {
  Future<Apod> getApod({required String dateForApi}) async =>
      await Api(Dio()).getApod(date: dateForApi);
}
