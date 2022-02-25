import 'package:nasa_apod/application/features/apod_screen/data/models/apod.dart';

abstract class ApodRepo {
  Future<Apod> getApod({required String date});
}
