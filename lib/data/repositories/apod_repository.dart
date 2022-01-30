import 'dart:convert';

import '../models/apod.dart';

import '../api/api.dart';

class ApodRepository {
  Future<Apod> getApod({required String dateForApi}) async {
    final jsonString = await Api().getApodFromApi(dateForApi);
    final jsonDecoded = jsonDecode(jsonString);
    return Apod.fromJson(json: jsonDecoded);
  }
}
