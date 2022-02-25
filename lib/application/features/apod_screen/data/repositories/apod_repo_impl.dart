import 'package:nasa_apod/application/features/apod_screen/data/data_sources/services/apod_service.dart';
import 'package:nasa_apod/application/features/apod_screen/data/models/apod_model.dart';
import 'package:nasa_apod/application/features/apod_screen/domain/repositories/apod_repo.dart';

class ApodRepoImpl extends ApodRepo {
  final ApodService apodService;

  ApodRepoImpl({required this.apodService});

  Future<ApodModel> getApod({required String date}) async =>
      await apodService.getApod(date: date);
}
