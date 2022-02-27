import 'package:nasa_apod/features/apod_screen/domain/entities/apod_entity.dart';

class ApodModel extends ApodEntity {
  const ApodModel({
    required DateTime date,
    required String title,
    required String explanation,
    required String url,
  }) : super(
          date: date,
          title: title,
          explanation: explanation,
          url: url,
        );

  factory ApodModel.fromJson(Map<String, dynamic> json) => ApodModel(
        date: DateTime.parse(json['date']),
        title: json['title'],
        explanation: json['explanation'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'explanation': explanation,
        'url': url,
      };
}
