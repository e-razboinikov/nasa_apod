import 'package:nasa_apod/features/apod_screen/domain/entities/apod_entity.dart';

class ApodModel extends ApodEntity {
  const ApodModel({
    required String title,
    required String explanation,
    required String url,
  }) : super(
          title: title,
          explanation: explanation,
          url: url,
        );

  factory ApodModel.fromJson(Map<String, dynamic> json) => ApodModel(
      title: json['title'], explanation: json['explanation'], url: json['url']);

  Map<String, dynamic> toJson() => {
        'title': title,
        'explanation': explanation,
        'url': url,
      };
}
