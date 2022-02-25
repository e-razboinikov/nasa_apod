import 'package:nasa_apod/application/features/apod_screen/data/models/apod_model.dart';

abstract class ApodRepo {
  Future<ApodModel> getApod({required String date});
}
