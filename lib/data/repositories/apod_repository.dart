import 'package:dio/dio.dart';

import '../api/api.dart';
import '../models/apod.dart';

class ApodRepository {
  Future<Apod> getApod({required String dateForApi}) async =>
      await Api(Dio()).getApod(date: dateForApi);
}
