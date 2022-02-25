import 'package:nasa_apod/application/features/apod_screen/data/data_sources/services/apod_service.dart';
import 'package:nasa_apod/application/features/apod_screen/domain/entities/apod_entity.dart';
import 'package:nasa_apod/application/features/apod_screen/domain/repositories/apod_repo.dart';

class ApodRepoImpl extends ApodRepo {
  final ApodService apodService;

  ApodRepoImpl({required this.apodService});

  Future<ApodEntity> getApod({required String date}) async =>
      await apodService.getApod(date: date);
}
