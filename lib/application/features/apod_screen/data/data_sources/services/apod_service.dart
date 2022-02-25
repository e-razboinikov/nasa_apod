import 'package:nasa_apod/application/features/apod_screen/data/data_sources/api/apod_api.dart';
import 'package:nasa_apod/application/features/apod_screen/data/models/apod.dart';

class ApodService {
  final ApodApi apodApi;

  const ApodService({required this.apodApi});

  Future<Apod> getApod({required String date}) async =>
      await apodApi.getApod(date: date);
}
