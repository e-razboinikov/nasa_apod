import 'package:equatable/equatable.dart';

class ApodEntity extends Equatable {
  final DateTime date;
  final String title;
  final String explanation;
  final String url;

  const ApodEntity({
    required this.date,
    required this.title,
    required this.explanation,
    required this.url,
  });

  @override
  List<Object?> get props => [
        date,
        title,
        explanation,
        url,
      ];
}
