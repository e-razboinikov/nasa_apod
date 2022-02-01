import 'package:freezed_annotation/freezed_annotation.dart';

part 'apod.freezed.dart';
part 'apod.g.dart';

@freezed
class Apod with _$Apod {
  const Apod._();

  const factory Apod({
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'explanation') required String explanation,
    @JsonKey(name: 'url') required String imageUrl,
  }) = _Apod;

  factory Apod.fromJson(Map<String, dynamic> json) => _$ApodFromJson(json);
}
