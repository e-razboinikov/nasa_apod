import 'package:intl/intl.dart';

class Apod {
  final DateTime date;
  final String explanation;
  final String title;
  final String url;
  final String hdurl;

  String get dateFormatted => DateFormat('yyyy-MM-dd').format(date);

  Apod({
    required this.date,
    required this.explanation,
    required this.title,
    required this.url,
    required this.hdurl,
  });

  factory Apod.fromJson(Map json) {
    return Apod(
      date: DateTime.parse(json['date']),
      explanation: json['explanation'],
      title: json['title'],
      url: json['url'],
      hdurl: json['hdurl'] ?? '',
    );
  }
}
