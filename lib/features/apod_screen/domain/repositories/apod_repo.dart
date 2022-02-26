import 'package:nasa_apod/features/apod_screen/domain/entities/apod_entity.dart';

abstract class ApodRepo {
  Future<ApodEntity> getApod({required String date});
}
