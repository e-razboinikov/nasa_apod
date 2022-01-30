import '../assets/images.dart';

class Apod {
  final String title;
  final String explanation;
  final String imageUrl;

  const Apod({
    required this.title,
    required this.explanation,
    required this.imageUrl,
  });

  factory Apod.fromJson({required Map<String, dynamic> json}) => Apod(
        title: json['title'] ?? 'Unknown APOD',
        explanation: json['explanation'] ?? 'Cant load APOD, try again',
        imageUrl: json['url'] ?? Images.placeholderImageUrl,
      );
}
